<?php

namespace App\Filament\Resources\Processos\BuscaeApreensao\TarefaMinutarSentencaResource\Pages;

use App\Filament\Resources\Processos\BuscaeApreensao\TarefaMinutarSentencaResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListTarefaMinutarSentencas extends ListRecords
{
    protected static string $resource = TarefaMinutarSentencaResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
