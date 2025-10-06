<?php

namespace App\Filament\Resources\CadastroProcessoResource\Pages;

use App\Filament\Resources\CadastroProcessoResource;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;

class CreateCadastroProcesso extends CreateRecord
{
    protected static string $resource = CadastroProcessoResource::class;

    protected function getFormActions(): array
    {
        return [
            $this->getCreateFormAction()->label('Salvar'),
            
            Actions\Action::make('createAnother')
                ->label('Salvar e cadastrar novo')
                ->action('createAnother')
                ->color('gray'),

            $this->getCancelFormAction()->label('Cancelar'),
        ];
    }
}