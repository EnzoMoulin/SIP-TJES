<?php

namespace App\Filament\Resources\CadastroOrgaoResource\Pages;

use App\Filament\Resources\CadastroOrgaoResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditCadastroOrgao extends EditRecord
{
    protected static string $resource = CadastroOrgaoResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
}
