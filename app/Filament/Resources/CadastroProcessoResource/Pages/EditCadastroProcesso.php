<?php

namespace App\Filament\Resources\CadastroProcessoResource\Pages;

use App\Filament\Resources\CadastroProcessoResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditCadastroProcesso extends EditRecord
{
    protected static string $resource = CadastroProcessoResource::class;

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