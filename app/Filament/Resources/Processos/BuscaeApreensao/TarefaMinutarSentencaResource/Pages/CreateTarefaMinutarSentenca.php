<?php

namespace App\Filament\Resources\Processos\BuscaeApreensao\TarefaMinutarSentencaResource\Pages;

use App\Filament\Pages\Base\FluxoPage;
use App\Filament\Resources\Processos\BuscaeApreensao\TarefaMinutarSentencaResource;
use App\Models\Fluxo;
use Illuminate\Database\Eloquent\Builder;

class CreateTarefaMinutarSentenca extends FluxoPage
{
    protected static string $resource = TarefaMinutarSentencaResource::class;
    protected static string $view = 'filament.resources.processos.buscaeapreensao.tarefa-minutar-sentenca.create';
    protected static ?string $title = 'Tarefa - Minutar Sentença';
    
    public $selectedOption = null;

    protected function getFluxoQuery(): Builder
    {
        return Fluxo::query()->whereBetween('id', [14, 26]);
    }

    public function selectOption(string $option): void
    {
        $this->selectedOption = $option;
        parent::selectOption($option);
        $this->selectedOption = null;
    }

    public function goBack(): void
    {
        parent::goBack();
        $this->selectedOption = null;
    }
}