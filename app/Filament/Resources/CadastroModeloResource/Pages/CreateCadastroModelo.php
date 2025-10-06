<?php

namespace App\Filament\Resources\CadastroModeloResource\Pages;

use App\Filament\Resources\CadastroModeloResource;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;

class CreateCadastroModelo extends CreateRecord
{
    protected static string $resource = CadastroModeloResource::class;

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