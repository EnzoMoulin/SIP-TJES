<?php

namespace App\Filament\Widgets;

use App\Models\Processo;
use Filament\Widgets\ChartWidget;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Cache;

class DashboardTipo extends ChartWidget
{
    protected static ?string $heading = 'Percentual de Processos por Tipo';
    protected static ?int $sort = 2;

    protected array $statusColors = [
        'Petição Inicial' => 'rgb(54, 162, 235)',
        'Busca e Apreensão' => 'rgb(255, 99, 132)',
        'Impugnação à Penhora' => 'rgb(255, 206, 86)',
        'Outros' => 'rgb(75, 192, 192)',
    ];

    protected function getData(): array
    {
        $processosPorStatus = Cache::remember('dashboard_tipo_processos', now()->addMinutes(5), function () {
            $order = "CASE 
                WHEN statusprocesso.descricao = 'Petição Inicial' THEN 1 
                WHEN statusprocesso.descricao = 'Busca e Apreensão' THEN 2 
                WHEN statusprocesso.descricao = 'Impugnação à Penhora' THEN 3 
                ELSE 4 
            END";

            return Processo::query()
                ->join('statusprocesso', 'processos.statusprocesso', '=', 'statusprocesso.id')
                ->select('statusprocesso.descricao as status_descricao', DB::raw('count(processos.id) as count'))
                ->groupBy('statusprocesso.descricao')
                ->orderByRaw($order)
                ->get();
        });

        $labels = $processosPorStatus->pluck('status_descricao');
        $totalProcessos = $processosPorStatus->sum('count');

        $data = $processosPorStatus->map(
            fn($item) => $totalProcessos === 0 ? 0 : round(($item->count / $totalProcessos) * 100, 2)
        );

        $backgroundColors = $processosPorStatus->map(
            fn($item) => $this->statusColors[$item->status_descricao] ?? $this->statusColors['Outros']
        );

        return [
            'datasets' => [
                [
                    'label' => 'Percentual de Processos por Tipo',
                    'data' => $data,
                    'backgroundColor' => $backgroundColors,
                ],
            ],
            'labels' => $labels,
        ];
    }

    protected function getType(): string
    {
        return 'pie';
    }

    protected function getOptions(): array
    {
        return [
            'plugins' => [
                'tooltip' => [
                    'enabled' => true,
                ],
                'datalabels' => [
                    'display' => true,
                    'color' => '#fff',
                    'font' => ['weight' => 'bold'],
                    'formatter' => "function(value, context) { return value + '%'; }",
                ],
            ],
            'plugins.registered' => ['ChartDataLabels'],
        ];
    }

    protected function getScripts(): array
    {
        return [
            <<<JS
            document.addEventListener('DOMContentLoaded', function () {
                if (window.FilamentCharts && window.FilamentCharts.charts) {
                    Object.values(window.FilamentCharts.charts).forEach(chart => {
                        if (chart.config.type === 'pie') {
                            if (typeof ChartDataLabels !== 'undefined') {
                                chart.config.options.plugins.datalabels = {
                                    display: true,
                                    color: '#fff',
                                    font: { weight: 'bold' },
                                    formatter: function(value) { return value + '%'; }
                                };
                                chart.update();
                            }
                        }
                    });
                }
            });
            JS,
        ];
    }
}