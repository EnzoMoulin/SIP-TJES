<?php

namespace App\Filament\Resources\Processos\PeticaoInicial\MinutarDespachoResource\Pages;

use App\Filament\Resources\Processos\PeticaoInicial\MinutarDespachoResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListMinutarDespachos extends ListRecords
{
    protected static string $resource = MinutarDespachoResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
