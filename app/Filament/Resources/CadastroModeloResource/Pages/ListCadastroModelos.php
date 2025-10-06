<?php

namespace App\Filament\Resources\CadastroModeloResource\Pages;

use App\Filament\Resources\CadastroModeloResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListCadastroModelos extends ListRecords
{
    protected static string $resource = CadastroModeloResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make()
                ->label('Cadastrar Novo Modelo'),
        ];
    }
}