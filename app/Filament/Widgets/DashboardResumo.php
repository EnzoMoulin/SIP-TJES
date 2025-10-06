<?php

namespace App\Filament\Widgets;

use App\Models\Processo;
use Filament\Widgets\StatsOverviewWidget as BaseWidget;
use Filament\Widgets\StatsOverviewWidget\Card;
use Illuminate\Support\Facades\DB;

class DashboardResumo extends BaseWidget
{
    protected ?string $heading = 'Resumo de Processos';
    protected static string $view = 'filament/widgets/dashboard-resumo';
    protected static ?int $sort = 1;

    protected function getCards(): array
    {
        $totalProcessos = Processo::count();
        $tiposDistintos = Processo::distinct('statusprocesso')->count('statusprocesso');
        $tipoMaisFrequente = Processo::select('statusprocesso', DB::raw('count(*) as total'))
            ->groupBy('statusprocesso')
            ->orderByDesc('total')
            ->first();

        $descricaoTipoMaisFrequente = 'N/A';
        if ($tipoMaisFrequente) {
            $status = DB::table('statusprocesso')
                ->where('id', $tipoMaisFrequente->statusprocesso)
                ->first();
            $descricaoTipoMaisFrequente = $status?->descricao ?? 'N/A';
        }

        return [
            Card::make('Total de Processos', $totalProcessos)
                ->extraAttributes(['style' => 'background-color: #f3f4f6;'])
                ->color('primary')
                ->description('Todos os processos cadastrados'),

            Card::make('Tipos Distintos', $tiposDistintos)
                ->extraAttributes(['style' => 'background-color: #f3f4f6;'])
                ->color('secondary')
                ->description('Quantidade de tipos de processos diferentes existentes')
                ->descriptionColor('info'),

            Card::make('Tipo Mais Frequente', $descricaoTipoMaisFrequente)
                ->extraAttributes(['style' => 'background-color: #f3f4f6;'])
                ->color('success')
                ->description('O tipo de processo mais comum'),
        ];
    }
}