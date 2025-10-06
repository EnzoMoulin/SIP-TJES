<?php

namespace App\Filament\Resources\Processos\PeticaoInicial\MinutarDespachoResource\Pages;

use App\Filament\Resources\Processos\PeticaoInicial\MinutarDespachoResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditMinutarDespacho extends EditRecord
{
    protected static string $resource = MinutarDespachoResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
}
