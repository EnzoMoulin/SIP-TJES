<?php

namespace App\Http\Controllers;

use App\Models\Modelo;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Route;
use Barryvdh\DomPDF\Facade\Pdf;
use SimpleSoftwareIO\QrCode\Generator as QrGenerator;

class ModeloController extends Controller
{
    /**
     * Mostra o modelo por slug/ID e gera o PDF com QR + assinatura/paginação em todas as páginas.
     *
     * @param string $slug
     * @return \Illuminate\Http\Response
     */
    public function showBySlug(string $slug)
    {
        // debug: o que chegou na rota
        Log::debug('showBySlug called with identifier', ['identifier' => $slug, 'url' => request()->fullUrl()]);

        // lookup robusto do modelo (id numérico -> slug -> urldecode -> case-insensitive)
        $modelo = null;

        if (is_numeric($slug)) {
            $modelo = Modelo::find($slug);
        }

        if (! $modelo) {
            $modelo = Modelo::where('slug', $slug)->first();
        }

        if (! $modelo) {
            $decoded = urldecode($slug);
            if ($decoded !== $slug) {
                $modelo = Modelo::where('slug', $decoded)->first();
            }
        }

        if (! $modelo) {
            $modelo = Modelo::whereRaw('LOWER(TRIM(slug)) = ?', [mb_strtolower(trim($slug))])->first();
        }

        if (! $modelo) {
            Log::warning('Modelo not found for identifier', ['identifier' => $slug]);
            abort(404, 'Modelo não encontrado');
        }

        // variáveis para view
        $capturedAt = now()->setTimezone('America/Sao_Paulo')->format('d/m/Y H:i:s');
        $signedBy   = $modelo->signed_by ?? ($modelo->assinante ?? 'FELLIPE ALVES DUARTE');
        $legalValue = $modelo->valor_legal ?? 'ORIGINAL';
        $nature     = $modelo->natureza ?? 'DOCUMENTO NATO-DIGITAL';

        // IDENTIFIER final (id preferencial)
        $identifier = $modelo->id ?? $modelo->slug ?? 'doc';

        // ============================
        // escolha do verificationToken
        // ============================
        // Prioriza tokens existentes no modelo (ajuste nomes conforme seu schema)
        $externalToken = $modelo->verification_token ?? $modelo->external_id ?? $modelo->token ?? null;

        // ---------- AQUI: token exemplo fixo se não houver um no modelo ----------
        // Mude '2025-FZH3TS' para o token que quiser testar; futuramente você trocará
        // para gerar tokens dinamicamente e salvar na tabela de tokens.
        $verificationToken = $externalToken ? (string) $externalToken : '2025-FZH3TS';
        // ------------------------------------------------------------------------

        // base pública configurável
        $edocsBase = env('EDOCS_BASE_URL', 'https://e-docs.es.gov.br');
        $verificationUrl = rtrim($edocsBase, '/') . '/d/' . rawurlencode($verificationToken);

        // registra para depuração (verifique storage/logs/laravel.log)
        Log::debug('verification URL/token', ['verificationUrl' => $verificationUrl, 'verificationToken' => $verificationToken]);

        // payload para QR (você pode incluir o token no payload se quiser)
        $payload = [
            'slug'   => $modelo->slug,
            'titulo' => $modelo->titulo ?? 'Documento',
            'id'     => $modelo->id ?? null,
            'ts'     => now()->toDateTimeString(),
            // opcional: incluir token no payload — retire se não quiser expor no QR
            'verification_token' => $verificationToken,
        ];

        $qr = $this->generateQrInline(json_encode($payload, JSON_UNESCAPED_UNICODE), 300);
        [$qrSvgRaw, $qrBase64] = $this->normalizeQr($qr);

        $data = [
            'modelo'           => $modelo,
            'qrSvgRaw'         => $qrSvgRaw,
            'qrBase64'         => $qrBase64,
            'capturedAt'       => $capturedAt,
            'signedBy'         => $signedBy,
            'legalValue'       => $legalValue,
            'nature'           => $nature,
            'verificationUrl'  => $verificationUrl,
            'verificationToken'=> $verificationToken,
        ];

        // renderiza view via barryvdh wrapper
        $pdf = Pdf::loadView('modelos.pdf', $data)
            ->setPaper('a4')
            ->setWarnings(false);

        $dompdf = $pdf->getDomPDF();
        $dompdf->set_option('isPhpEnabled', true);

        // renderiza para DOMPDF calcular páginas
        $dompdf->render();

        // pega canvas e métricas
        $canvas = $dompdf->getCanvas();
        $fontMetrics = $dompdf->getFontMetrics();
        try {
            $font = $fontMetrics->getFont('DejaVu Sans', 'normal');
        } catch (\Throwable $e) {
            $font = null;
        }

        $pageCount = $canvas->get_page_count();
        $pageWidth = $canvas->get_width();
        $pageHeight = $canvas->get_height();

        // --- RODAPÉ CENTRALIZADO ---
        $footerText = 'Página {PAGE_NUM} de {PAGE_COUNT}';
        $footerSize = 9;

        $placeholder = str_replace(['{PAGE_NUM}', '{PAGE_COUNT}'], ['1', (string) $pageCount], $footerText);
        $footerWidth = 0;
        if ($font !== null) {
            try { $footerWidth = $fontMetrics->getTextWidth($placeholder, $font, $footerSize); } catch (\Throwable $e) { $footerWidth = 0; }
        }
        $xFooter = ($pageWidth - ($footerWidth ?: 100)) / 2;
        $yFooter = $pageHeight - 35;
        $canvas->page_text($xFooter, $yFooter, $footerText, $font, $footerSize, [0,0,0]);

        // --- ASSINATURA LATERAL ---
        $sideSize = 8;
        // usa o mesmo token aqui (verificationToken) — substitui texto fixo
        $sideText = sprintf(
            "%s - E-DOCS - DOCUMENTO ORIGINAL   %s   PÁGINA {PAGE_NUM} / {PAGE_COUNT}",
            $verificationToken,
            $capturedAt
        );

        $sidePlaceholder = str_replace(['{PAGE_NUM}', '{PAGE_COUNT}'], ['1', (string) $pageCount], $sideText);
        $sideTextWidth = 0;
        if ($font !== null) {
            try { $sideTextWidth = $fontMetrics->getTextWidth($sidePlaceholder, $font, $sideSize); } catch (\Throwable $e) { $sideTextWidth = 0; }
        }

        $xSide = $pageWidth - 12;
        $ySide = ($pageHeight / 2) + ($sideTextWidth / 2);

        $sideColor = [34/255, 137/255, 255/255];
        $canvas->page_text($xSide, $ySide, $sideText, $font, $sideSize, $sideColor, 0, 0, -90);

        // retorna PDF ao browser
        return $pdf->stream("{$modelo->slug}.pdf");
    }

    /**
     * Gera QR inline (SVG preferencial). Retorna data-uri.
     */
    protected function generateQrInline(string $text, int $size = 180): string
    {
        try {
            $generator = new QrGenerator();

            $svg = $generator->format('svg')->size($size)->generate($text);
            if (!empty($svg) && strlen($svg) > 50) {
                @file_put_contents(storage_path('app/qr_debug.svg'), $svg);
                Log::debug('QR: generated SVG, length=' . strlen($svg));
                return 'data:image/svg+xml;base64,' . base64_encode($svg);
            }

            Log::warning('QR: SVG generation empty, trying PNG');

            $png = $generator->format('png')->size($size)->margin(1)->generate($text);
            if (!empty($png) && strlen($png) > 200 && function_exists('imagecreatefromstring')) {
                $qrImg = imagecreatefromstring($png);
                if ($qrImg !== false) {
                    $w = imagesx($qrImg);
                    $h = imagesy($qrImg);

                    $paddingRatio = 0.25;
                    $padW = (int)($w * (1 + $paddingRatio));
                    $padH = (int)($h * (1 + $paddingRatio));
                    $offsetX = (int)(($padW - $w) / 2);
                    $offsetY = (int)(($padH - $h) / 2);

                    $final = imagecreatetruecolor($padW, $padH);
                    $white = imagecolorallocate($final, 255, 255, 255);
                    imagefilledrectangle($final, 0, 0, $padW, $padH, $white);
                    imagecopy($final, $qrImg, $offsetX, $offsetY, 0, 0, $w, $h);

                    ob_start();
                    imagejpeg($final, null, 90);
                    $jpeg = ob_get_clean();

                    imagedestroy($qrImg);
                    imagedestroy($final);

                    if ($jpeg) {
                        Log::debug('QR: generated padded JPEG, bytes=' . strlen($jpeg));
                        return 'data:image/jpeg;base64,' . base64_encode($jpeg);
                    }
                }
            }

            Log::warning('QR: PNG generation failed or too small');
        } catch (\Throwable $e) {
            Log::error('QR generation error: ' . $e->getMessage());
        }

        return 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR4nGNgYAAAAAMAASsJTYQAAAAASUVORK5CYII=';
    }

    /**
     * Normaliza retorno do QR para a view.
     */
    protected function normalizeQr(?string $qr): array
    {
        $qr = trim((string) $qr);
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
        } else {
            $qrBase64 = $qr;
        }

        return [$qrSvgRaw, $qrBase64];
    }

    /**
     * Visualização local (debug) — injeta mesmas variáveis da geração real.
     */
    public function preview(Request $request, $slug)
    {
        if (! app()->environment('local')) {
            abort(404);
        }

        $modelo = Modelo::where('slug', $slug)->firstOrFail();

        $capturedAt = now()->setTimezone('America/Sao_Paulo')->format('d/m/Y H:i:s');
        $signedBy   = $modelo->signed_by ?? ($modelo->assinante ?? 'FELLIPE ALVES DUARTE');
        $legalValue = $modelo->valor_legal ?? 'ORIGINAL';
        $nature     = $modelo->natureza ?? 'DOCUMENTO NATO-DIGITAL';
        $identifier = $modelo->id ?? $modelo->slug ?? 'doc';

        $externalToken = $modelo->verification_token ?? $modelo->external_id ?? $modelo->token ?? null;
        $verificationToken = $externalToken ? (string) $externalToken : '2025-FZH3TS';
        $edocsBase = env('EDOCS_BASE_URL', 'https://e-docs.es.gov.br');
        $verificationUrl = rtrim($edocsBase, '/') . '/d/' . rawurlencode($verificationToken);

        $payload = [
            'slug'   => $slug,
            'titulo' => $modelo->titulo ?? 'Preview',
            'ts'     => now()->toDateTimeString(),
            'verification_token' => $verificationToken,
        ];

        $qr = $this->generateQrInline(json_encode($payload, JSON_UNESCAPED_UNICODE), 300);
        [$qrSvgRaw, $qrBase64] = $this->normalizeQr($qr);

        return view('modelos.pdf', [
            'modelo'           => $modelo,
            'qrSvgRaw'         => $qrSvgRaw,
            'qrBase64'         => $qrBase64,
            'capturedAt'       => $capturedAt,
            'signedBy'         => $signedBy,
            'legalValue'       => $legalValue,
            'nature'           => $nature,
            'verificationUrl'  => $verificationUrl,
            'verificationToken'=> $verificationToken,
        ]);
    }
}