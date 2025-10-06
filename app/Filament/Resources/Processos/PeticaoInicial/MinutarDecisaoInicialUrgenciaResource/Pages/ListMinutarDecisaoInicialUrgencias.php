<?php

namespace App\Filament\Resources\Processos\PeticaoInicial\MinutarDecisaoInicialUrgenciaResource\Pages;

use App\Filament\Resources\Processos\PeticaoInicial\MinutarDecisaoInicialUrgenciaResource;
use Filament\Resources\Pages\ListRecords;

class ListMinutarDecisaoInicialUrgencias extends ListRecords
{
    protected static string $resource = MinutarDecisaoInicialUrgenciaResource::class;

    protected function getHeaderWidgets(): array
    {
        return [];
    }
}