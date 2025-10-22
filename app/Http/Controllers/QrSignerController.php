<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use SimpleSoftwareIO\QrCode\Facades\QrCode;
use Carbon\Carbon;
use App\Models\QrSignature;

class QrSignerController extends Controller
{
    protected $privateKey;
    protected $publicKey;
    protected $baseUrl;
    protected $ttl;

    public function __construct()
    {
        $this->privateKey = env('QR_SIGNER_PRIVATE_KEY_PATH') ? @file_get_contents(env('QR_SIGNER_PRIVATE_KEY_PATH')) : null;
        $this->publicKey  = env('QR_SIGNER_PUBLIC_KEY_PATH') ? @file_get_contents(env('QR_SIGNER_PUBLIC_KEY_PATH')) : null;
        $this->baseUrl    = env('QR_BASE_URL', null);
        $this->ttl        = intval(env('QR_SIGNER_TOKEN_TTL_SECONDS', 86400));
    }

    /**
     * API endpoint to generate a signed token (kept for compatibility).
     * Expects document_id and document_content (content used for hash).
     */
    public function generate(Request $request)
    {
        $documentId = $request->input('document_id');
        $documentContent = $request->input('document_content');
        if (!$documentId || !$documentContent) {
            return response()->json(['error' => 'document_id and document_content required'], 400);
        }

        $hash = hash('sha256', $documentContent);
        $payload = json_encode(['doc_id' => (int)$documentId, 'hash' => $hash, 'ts' => time()]);

        if (!$this->privateKey) {
            return response()->json(['error' => 'private key not configured'], 500);
        }

        openssl_sign($payload, $signature, $this->privateKey, OPENSSL_ALGO_SHA256);
        $sigB64 = rtrim(strtr(base64_encode($signature), '+/', '-_'), '=');
        $payloadB64 = rtrim(strtr(base64_encode($payload), '+/', '-_'), '=');

        $token = $payloadB64 . '.' . $sigB64;
        $verifyUrl = ($this->baseUrl ? rtrim($this->baseUrl, '/') : '') . '/d/' . urlencode($token);

        // generate and persist QR svg
        try {
            $qrSvg = QrCode::size(300)->format('svg')->generate($verifyUrl);
            $fileName = 'qrs/qr_' . $documentId . '_' . time() . '.svg';
            Storage::disk('public')->put($fileName, $qrSvg);
            $qrUrl = Storage::url($fileName);
        } catch (\Throwable $e) {
            $qrUrl = null;
        }

        $record = QrSignature::create([
            'document_id' => $documentId,
            'payload_hash' => $hash,
            'payload' => $payload,
            'signature' => $sigB64,
            'qr_url' => $qrUrl,
            'expires_at' => Carbon::now()->addSeconds($this->ttl),
        ]);

        return response()->json([
            'qr_url' => $qrUrl,
            'verify_url' => $verifyUrl,
            'token' => $token,
            'record_id' => $record->id,
        ]);
    }

    /**
     * Verifica token passado por query (?t=...)
     */
    public function verify(Request $request)
    {
        $token = $request->query('t');
        if (!$token) return response()->json(['valid' => false, 'reason' => 'token missing'], 400);

        return $this->verifyTokenCompact($token);
    }

    /**
     * Verifica token passado na URL via path /d/{token}
     * (útil para links públicos como https://e-docs.../d/<token>)
     */
    public function verifyPath($token)
    {
        if (!$token) return response()->json(['valid' => false, 'reason' => 'token missing'], 400);

        return $this->verifyTokenCompact($token);
    }

    /**
     * Função interna que valida o token compacto (payloadB64.sigB64).
     */
    protected function verifyTokenCompact(string $token)
    {
        if (strpos($token, '.') === false) {
            return response()->json(['valid' => false, 'reason' => 'invalid token format'], 400);
        }

        [$payloadB64, $sigB64] = explode('.', $token, 2);

        $payloadJson = base64_decode(strtr($payloadB64, '-_', '+/'));
        $signature = base64_decode(strtr($sigB64, '-_', '+/'));

        if ($this->publicKey) {
            $ok = openssl_verify($payloadJson, $signature, $this->publicKey, OPENSSL_ALGO_SHA256);
            if ($ok !== 1) return response()->json(['valid' => false, 'reason' => 'invalid signature'], 400);
        } else {
            // se não houver publicKey, tentamos procurar na base (registro) e comparar assinatura armazenada
            $payloadHash = hash('sha256', $payloadJson ?: '');
            $record = QrSignature::where('payload_hash', $payloadHash)->where('signature', $sigB64)->first();
            if (!$record) {
                return response()->json(['valid' => false, 'reason' => 'signature not verifiable'], 400);
            }
            // continuar validação via registro se necessário
        }

        $payload = json_decode($payloadJson, true);
        if (!is_array($payload) || !isset($payload['ts'])) {
            return response()->json(['valid' => false, 'reason' => 'invalid payload'], 400);
        }

        if (time() - intval($payload['ts']) > $this->ttl) {
            return response()->json(['valid' => false, 'reason' => 'expired'], 400);
        }

        // Se tudo ok, devolve dados úteis
        return response()->json(['valid' => true, 'payload' => $payload]);
    }
}