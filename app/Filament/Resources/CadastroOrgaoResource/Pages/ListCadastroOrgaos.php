<?php

namespace App\Filament\Resources\CadastroOrgaoResource\Pages;

use App\Filament\Resources\CadastroOrgaoResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListCadastroOrgaos extends ListRecords
{
    protected static string $resource = CadastroOrgaoResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
