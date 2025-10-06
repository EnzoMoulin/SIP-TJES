<?php

namespace App\Filament\Resources\CadastroModeloResource\Pages;

use App\Filament\Resources\CadastroModeloResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditCadastroModelo extends EditRecord
{
    protected static string $resource = CadastroModeloResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }

    protected function getRedirectUrl(): string
    {
        return $this->getResource()::getUrl('index');
    }
}