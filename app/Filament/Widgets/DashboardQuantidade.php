<?php

namespace App\Filament\Widgets;

use App\Models\Processo;
use Filament\Widgets\ChartWidget;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Cache;

class DashboardQuantidade extends ChartWidget
{
    protected static ?string $heading = 'Quantidade de Processos por Tipo';
    protected static ?int $sort = 3;

    protected string $cacheKey = 'dashboard:processos:quantidade';
    protected int $cacheTtl = 60;

    protected array $cachedChart = [
        'labels' => [],
        'data' => [],
    ];

    protected function loadChartData(): void
    {
        $cached = Cache::remember($this->cacheKey, $this->cacheTtl, function () {
            $order = "CASE WHEN statusprocesso.descricao = 'Petição Inicial' THEN 1 
                          WHEN statusprocesso.descricao = 'Busca e Apreensão' THEN 2 
                          WHEN statusprocesso.descricao = 'Impugnação à Penhora' THEN 3 
                          ELSE 4 END";

            $rows = Processo::query()
                ->join('statusprocesso', 'processos.statusprocesso', '=', 'statusprocesso.id')
                ->select('statusprocesso.descricao as status_descricao', DB::raw('count(processos.id) as count'))
                ->groupBy('statusprocesso.descricao')
                ->orderByRaw($order)
                ->get();

            $labels = $rows->pluck('status_descricao')->toArray();
            $data = $rows->pluck('count')->map(fn($v) => (int) $v)->toArray();

            return [
                'labels' => $labels,
                'data' => $data,
            ];
        });

        $this->cachedChart['labels'] = $cached['labels'] ?? [];
        $this->cachedChart['data'] = $cached['data'] ?? [];
    }

    protected function getData(): array
    {
        $this->loadChartData();

        $colors = [
            'rgba(255, 99, 132, 0.2)',
            'rgba(54, 162, 235, 0.2)',
            'rgba(255, 205, 86, 0.2)',
            'rgba(75, 192, 192, 0.2)',
            'rgba(153, 102, 255, 0.2)',
            'rgba(255, 159, 64, 0.2)',
        ];

        $borderColors = [
            'rgb(255, 99, 132)',
            'rgb(54, 162, 235)',
            'rgb(255, 205, 86)',
            'rgb(75, 192, 192)',
            'rgb(153, 102, 255)',
            'rgb(255, 159, 64)',
        ];

        $labelCount = count($this->cachedChart['labels']);
        $bg = array_slice($colors, 0, $labelCount);
        $bc = array_slice($borderColors, 0, $labelCount);

        return [
            'datasets' => [
                [
                    'label' => 'Quantidade de Processos',
                    'data' => $this->cachedChart['data'],
                    'backgroundColor' => $bg,
                    'borderColor' => $bc,
                    'borderWidth' => 1,
                ],
            ],
            'labels' => $this->cachedChart['labels'],
        ];
    }

    protected function getType(): string
    {
        return 'bar';
    }

    protected function niceStep(int $rawStep): int
    {
        if ($rawStep <= 1) {
            return 1;
        }
        $power = (int) floor(log10($rawStep));
        $base = (int) pow(10, $power);
        $normalized = $rawStep / $base;

        if ($normalized <= 1) {
            $nice = 1;
        } elseif ($normalized <= 2) {
            $nice = 2;
        } elseif ($normalized <= 5) {
            $nice = 5;
        } else {
            $nice = 10;
        }

        return $nice * $base;
    }

    protected function getOptions(): array
    {
        $this->loadChartData();

        $data = $this->cachedChart['data'] ?? [];
        $max = (count($data) > 0) ? (int) max($data) : 1;
        $max = max(1, $max);

        $targetTicks = 6;
        $rawStep = (int) ceil($max / $targetTicks);
        $step = ($max <= 12) ? 1 : $this->niceStep($rawStep);
        $suggestedMax = (int) (ceil($max / $step) * $step);

        $maxTicksLimit = 10;

        return [
            'backgroundColor' => 'transparent',
            'plugins' => [
                'legend' => [
                    'display' => false,
                ],
            ],
            'scales' => [
                'y' => [
                    'beginAtZero' => true,
                    'suggestedMax' => $suggestedMax,
                    'ticks' => [
                        'stepSize' => $step,
                        'precision' => 0,
                    ],
                    'maxTicksLimit' => $maxTicksLimit,
                ],
            ],
        ];
    }
}