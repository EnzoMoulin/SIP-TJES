<?php

namespace App\Filament\Resources\Processos\ImpugnacaoPenhora\SISBAJUDResource\Pages;

use App\Filament\Resources\Processos\ImpugnacaoPenhora\SISBAJUDResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditSISBAJUD extends EditRecord
{
    protected static string $resource = SISBAJUDResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
}
