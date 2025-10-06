<?php

namespace App\Filament\Resources\Processos\ImpugnacaoPenhora\SISBAJUDResource\Pages;

use App\Filament\Resources\Processos\ImpugnacaoPenhora\SISBAJUDResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListSISBAJUDS extends ListRecords
{
    protected static string $resource = SISBAJUDResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
