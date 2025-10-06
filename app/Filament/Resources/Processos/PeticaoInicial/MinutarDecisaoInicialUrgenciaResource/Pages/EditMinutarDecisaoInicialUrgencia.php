<?php

namespace App\Filament\Resources\Processos\PeticaoInicial\MinutarDecisaoInicialUrgenciaResource\Pages;

use App\Filament\Resources\Processos\PeticaoInicial\MinutarDecisaoInicialUrgenciaResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditMinutarDecisaoInicialUrgencia extends EditRecord
{
    protected static string $resource = MinutarDecisaoInicialUrgenciaResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
}
