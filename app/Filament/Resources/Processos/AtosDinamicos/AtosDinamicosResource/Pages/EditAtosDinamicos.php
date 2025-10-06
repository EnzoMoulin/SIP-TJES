<?php

namespace App\Filament\Resources\Processos\AtosDinamicos\AtosDinamicosResource\Pages;

use App\Filament\Resources\Processos\AtosDinamicos\AtosDinamicosResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditAtosDinamicos extends EditRecord
{
    protected static string $resource = AtosDinamicosResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
}
