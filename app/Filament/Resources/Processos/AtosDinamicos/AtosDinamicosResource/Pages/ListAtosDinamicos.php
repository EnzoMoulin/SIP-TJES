<?php

namespace App\Filament\Resources\Processos\AtosDinamicos\AtosDinamicosResource\Pages;

use App\Filament\Resources\Processos\AtosDinamicos\AtosDinamicosResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListAtosDinamicos extends ListRecords
{
    protected static string $resource = AtosDinamicosResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make()
                ->label('Criar Ato Dinâmico'),
        ];
    }
}