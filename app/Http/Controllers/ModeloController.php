<?php

namespace App\Http\Controllers;

use App\Models\Modelo;
use Barryvdh\DomPDF\Facade\Pdf;
use Illuminate\Http\Response;

class ModeloController extends Controller
{
    public function showBySlug(string $slug): Response
    {
        $modelo = Modelo::where('slug', $slug)->firstOrFail();
        $currentDate = now()->setTimezone('America/Sao_Paulo')->format('d/m/Y H:i');

        $pdf = Pdf::loadView('modelos.pdf', compact('modelo', 'currentDate'));
        $pdf->setPaper('A4', 'portrait');

        $pdf->render();

        $pdf->getDomPDF()->getCanvas()->page_script(function ($pageNumber, $pageCount, $canvas, $fontMetrics) use ($currentDate) {
            $font = $fontMetrics->getFont("DejaVu Sans", "normal");
            $fontSize = 8;

            $pageWidth  = $canvas->get_width();
            $pageHeight = $canvas->get_height();

            $footerText = "Página {$pageNumber} de {$pageCount}";
            $textWidth  = $fontMetrics->getTextWidth($footerText, $font, $fontSize);

            $x = ($pageWidth - $textWidth) / 2;
            $y = $pageHeight - 25;

            $canvas->text($x, $y, $footerText, $font, $fontSize, [0, 0, 0]);

            $signatureText = sprintf(
                "2025-FZH3TS - E-DOCS - DOCUMENTO ORIGINAL   %s   PÁGINA %d / %d",
                $currentDate,
                $pageNumber,
                $pageCount
            );

            $textWidthSig = $fontMetrics->getTextWidth($signatureText, $font, $fontSize);

            $marginRight = 15;
            $x = $pageWidth - $marginRight;
            $y = ($pageHeight / 2) + ($textWidthSig / 2);

            $canvas->save();
            $canvas->rotate(-90, $x, $y);
            $canvas->text($x, $y, $signatureText, $font, $fontSize, [0, 0.498, 1]);
            $canvas->restore();
        });

        $nomeArquivo = $modelo->slug . '.pdf';
        return response($pdf->output(), 200, [
            'Content-Type'        => 'application/pdf',
            'Content-Disposition' => 'inline; filename="' . $nomeArquivo . '"'
        ]);
    }
}