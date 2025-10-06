<?php

namespace App\Filament\Resources\CadastroProcessoResource\Pages;

use App\Filament\Resources\CadastroProcessoResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListCadastroProcesso extends ListRecords
{
    protected static string $resource = CadastroProcessoResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make()
                ->label('Cadastrar Novo Processo'),
        ];
    }
}