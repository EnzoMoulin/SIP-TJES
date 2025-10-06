<?php

namespace App\Filament\Resources\Processos\PeticaoInicial\MinutarDespachoResource\Pages;

use App\Filament\Pages\Base\FluxoPage;
use App\Filament\Resources\Processos\PeticaoInicial\MinutarDespachoResource;
use App\Models\Fluxo;
use Illuminate\Database\Eloquent\Builder;

class CreateMinutarDespacho extends FluxoPage 
{
    protected static string $resource = MinutarDespachoResource::class;
    protected static string $view = 'filament.resources.processos.peticao-inicial.minutar-despacho.create';
    protected static ?string $title = 'Minutar Despacho';

    public int $statusProcessoAtual;

    public function mount(): void
    {
        $this->statusProcessoAtual = (int) request()->query('statusprocesso_id', 1);

        parent::mount();
    }

    protected function getFluxoQuery(): Builder
    {
        return Fluxo::query()
            ->where('statusprocesso_id', $this->statusProcessoAtual)
            ->where(function ($query) {
                $query->whereBetween('id', [1, 13])
                      ->orWhereBetween('id', [36, 39]);
            });
    }


    public $selectedOption = null;

  
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