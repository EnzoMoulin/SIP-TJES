<?php

namespace App\Http\Controllers;

use App\Models\Modelo;
use App\Models\QrSignature;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Barryvdh\DomPDF\Facade\Pdf;
use SimpleSoftwareIO\QrCode\Generator as QrGenerator;

class ModeloController extends Controller
{
    /**
     * Mostra o modelo por slug/ID e gera o PDF com QR + assinatura/paginação.
     */
    public function showBySlug(string $slug)
    {
        Log::debug('showBySlug called', ['slug' => $slug]);

        $modelo = is_numeric($slug)
            ? Modelo::find($slug)
            : Modelo::whereRaw('LOWER(TRIM(slug)) = ?', [mb_strtolower(trim(urldecode($slug)))])->first();

        if (!$modelo) {
            abort(404, 'Modelo não encontrado');
        }

        $capturedAt = now()->setTimezone('America/Sao_Paulo')->format('d/m/Y H:i:s');
        $signedBy   = $modelo->signed_by ?? $modelo->assinante ?? 'FELLIPE ALVES DUARTE';
        $legalValue = $modelo->valor_legal ?? 'ORIGINAL';
        $nature     = $modelo->natureza ?? 'DOCUMENTO NATO-DIGITAL';

        // ✅ Gera token aleatório e link completo
        $token = $this->generateRandomToken();
        $edocsBase = rtrim(env('EDOCS_BASE_URL', 'https://e-docs.es.gov.br'), '/');
        $verificationUrl = $edocsBase . '/d/' . rawurlencode($token);

        // Payload do QR
        $payload = [
            'slug'               => $modelo->slug,
            'titulo'             => $modelo->titulo ?? 'Documento',
            'id'                 => $modelo->id ?? null,
            'ts'                 => now()->toDateTimeString(),
            'verification_token' => $token,
            'verify_url'         => $verificationUrl,
        ];

        [$qrSvgRaw, $qrBase64] = $this->normalizeQr(
            $this->generateQrInline($verificationUrl, 300) // ✅ QR com link direto
        );

        // Persistência da assinatura
        try {
            $payloadHash = hash('sha256', json_encode($payload, JSON_UNESCAPED_UNICODE));

            QrSignature::updateOrCreate(
                [
                    'document_id' => $modelo->id,
                    'payload_hash'=> $payloadHash
                ],
                [
                    'payload'    => json_encode($payload, JSON_UNESCAPED_UNICODE),
                    'signature'  => $token,
                    'qr_url'     => $verificationUrl,
                    'expires_at' => now()->addSeconds(intval(env('QR_SIGNER_TOKEN_TTL_SECONDS', 86400))),
                ]
            );
        } catch (\Throwable $e) {
            Log::warning('Falha ao persistir QrSignature: ' . $e->getMessage());
        }

        $data = compact(
            'modelo', 'qrSvgRaw', 'qrBase64', 'capturedAt',
            'signedBy', 'legalValue', 'nature',
            'verificationUrl', 'token'
        );

        // Gera PDF
        $pdf = Pdf::loadView('modelos.pdf', $data)
            ->setPaper('a4')
            ->setWarnings(false);
        $dompdf = $pdf->getDomPDF();
        $dompdf->set_option('isPhpEnabled', true);
        $dompdf->render();

        $canvas = $dompdf->getCanvas();
        $fontMetrics = $dompdf->getFontMetrics();
        $font = null;
        try { $font = $fontMetrics->getFont('DejaVu Sans', 'normal'); } catch (\Throwable) {}

        $pageCount = $canvas->get_page_count();
        $pageWidth = $canvas->get_width();
        $pageHeight = $canvas->get_height();

        // Rodapé
        $footerText = 'Página {PAGE_NUM} de {PAGE_COUNT}';
        $footerSize = 9;
        $xFooter = ($pageWidth - ($font ? $fontMetrics->getTextWidth(
            str_replace(['{PAGE_NUM}','{PAGE_COUNT}'], ['1',(string)$pageCount], $footerText), $font, $footerSize) : 100)) / 2;
        $canvas->page_text($xFooter, $pageHeight - 35, $footerText, $font, $footerSize, [0,0,0]);

        // Assinatura lateral
        $sideSize = 8;
        $sideText = sprintf(
            "%s - E-DOCS - DOCUMENTO ORIGINAL   %s   PÁGINA {PAGE_NUM} / {PAGE_COUNT}",
            $token, // ✅ agora mostra o token completo 2025-XXXXXX
            $capturedAt
        );
        $sideTextWidth = $font ? $fontMetrics->getTextWidth(
            str_replace(['{PAGE_NUM}','{PAGE_COUNT}'], ['1',(string)$pageCount], $sideText), $font, $sideSize
        ) : 0;
        $canvas->page_text($pageWidth - 12, ($pageHeight / 2) + ($sideTextWidth / 2), $sideText, $font, $sideSize, [34/255,137/255,255/255], 0,0,-90);

        return $pdf->stream("{$modelo->slug}.pdf");
    }

    /**
     * Preview local (ambiente dev) — usa o mesmo token e link
     */
    public function preview(Request $request, $slug)
    {
        $modelo = Modelo::where('slug', $slug)->firstOrFail();

        $capturedAt = now()->setTimezone('America/Sao_Paulo')->format('d/m/Y H:i:s');
        $signedBy   = $modelo->signed_by ?? $modelo->assinante ?? 'FELLIPE ALVES DUARTE';
        $legalValue = $modelo->valor_legal ?? 'ORIGINAL';
        $nature     = $modelo->natureza ?? 'DOCUMENTO NATO-DIGITAL';

        $token = $this->generateRandomToken();
        $edocsBase = rtrim(env('EDOCS_BASE_URL', 'https://e-docs.es.gov.br'), '/');
        $verificationUrl = $edocsBase . '/d/' . rawurlencode($token);

        [$qrSvgRaw, $qrBase64] = $this->normalizeQr(
            $this->generateQrInline($verificationUrl, 300)
        );

        return view('modelos.pdf', [
            'modelo'           => $modelo,
            'qrSvgRaw'         => $qrSvgRaw,
            'qrBase64'         => $qrBase64,
            'capturedAt'       => $capturedAt,
            'signedBy'         => $signedBy,
            'legalValue'       => $legalValue,
            'nature'           => $nature,
            'verificationUrl'  => $verificationUrl,
            'token'            => $token,
        ]);
    }

    /** Gera token aleatório alfanumérico 2025-XXXXXX */
    private function generateRandomToken(): string
    {
        $chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
        $random = '';
        for ($i = 0; $i < 6; $i++) {
            $random .= $chars[random_int(0, strlen($chars) - 1)];
        }
        return '2025-' . $random;
    }

    protected function generateQrInline(string $text, int $size = 180): string
    {
        try {
            $generator = new QrGenerator();
            $svg = $generator->format('svg')->size($size)->generate($text);
            return 'data:image/svg+xml;base64,' . base64_encode($svg);
        } catch (\Throwable $e) {
            Log::error('QR generation error: ' . $e->getMessage());
        }
        return '';
    }

    protected function normalizeQr(?string $qr): array
    {
        $qrSvgRaw = null;
        $qrBase64 = null;

        if (str_starts_with($qr, 'data:')) {
            $qrBase64 = $qr;
            if (preg_match('#^data:image/svg\+xml;base64,(.*)#', $qr, $m)) {
                $decoded = base64_decode($m[1]);
                if ($decoded !== false && str_starts_with(trim($decoded), '<svg')) {
                    $qrSvgRaw = $decoded;
                }
            }
        } elseif (str_starts_with($qr, '<svg')) {
            $qrSvgRaw = $qr;
            $qrBase64 = 'data:image/svg+xml;base64,' . base64_encode($qr);
        }

        return [$qrSvgRaw, $qrBase64];
    }

    protected function shortTokenForStamp(string $token): string
    {
        return strlen($token) > 12 ? substr($token, 0, 12) : $token;
    }
}