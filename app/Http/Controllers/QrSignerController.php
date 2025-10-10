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
        $this->privateKey = file_get_contents(env('QR_SIGNER_PRIVATE_KEY_PATH'));
        $this->publicKey  = file_get_contents(env('QR_SIGNER_PUBLIC_KEY_PATH'));
        $this->baseUrl    = env('QR_BASE_URL');
        $this->ttl        = intval(env('QR_SIGNER_TOKEN_TTL_SECONDS', 86400));
    }

    public function generate(Request $request)
    {
        $documentId = $request->input('document_id');
        $documentContent = $request->input('document_content');
        if (!$documentId || !$documentContent) {
            return response()->json(['error' => 'document_id and document_content required'], 400);
        }

        $hash = hash('sha256', $documentContent);
        $payload = json_encode(['doc_id' => (int)$documentId, 'hash' => $hash, 'ts' => time()]);

        openssl_sign($payload, $signature, $this->privateKey, OPENSSL_ALGO_SHA256);
        $sigB64 = rtrim(strtr(base64_encode($signature), '+/', '-_'), '=');
        $payloadB64 = rtrim(strtr(base64_encode($payload), '+/', '-_'), '=');

        $token = $payloadB64 . '.' . $sigB64;
        $verifyUrl = $this->baseUrl . '?t=' . urlencode($token);

        $qrSvg = QrCode::size(300)->generate($verifyUrl);
        $fileName = 'qrs/qr_' . $documentId . '_' . time() . '.svg';
        Storage::disk('public')->put($fileName, $qrSvg);

        $record = QrSignature::create([
            'document_id' => $documentId,
            'payload_hash' => $hash,
            'payload' => $payload,
            'signature' => $sigB64,
            'qr_url' => Storage::url($fileName),
            'expires_at' => Carbon::now()->addSeconds($this->ttl),
        ]);

        return response()->json([
            'qr_url' => Storage::url($fileName),
            'verify_url' => $verifyUrl,
            'token' => $token,
            'record_id' => $record->id,
        ]);
    }

    public function verify(Request $request)
    {
        $token = $request->query('t');
        if (!$token) return response()->json(['valid' => false, 'reason' => 'token missing'], 400);

        [$payloadB64, $sigB64] = explode('.', $token, 2);
        $payloadJson = base64_decode(strtr($payloadB64, '-_', '+/'));
        $signature = base64_decode(strtr($sigB64, '-_', '+/'));

        $ok = openssl_verify($payloadJson, $signature, $this->publicKey, OPENSSL_ALGO_SHA256);
        if ($ok !== 1) return response()->json(['valid' => false, 'reason' => 'invalid signature'], 400);

        $payload = json_decode($payloadJson, true);
        if (time() - $payload['ts'] > $this->ttl)
            return response()->json(['valid' => false, 'reason' => 'expired'], 400);

        return response()->json(['valid' => true, 'doc_id' => $payload['doc_id'], 'hash' => $payload['hash']]);
    }
}
