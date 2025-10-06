<?php

namespace App\Filament\Resources\Processos\BuscaeApreensao\ClasseBAAFn81Resource\Pages;

use App\Filament\Resources\Processos\BuscaeApreensao\ClasseBAAFn81Resource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListClasseBAAFn81s extends ListRecords
{
    protected static string $resource = ClasseBAAFn81Resource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
