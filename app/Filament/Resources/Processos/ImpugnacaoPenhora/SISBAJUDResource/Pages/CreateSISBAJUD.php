<?php

namespace App\Filament\Resources\Processos\ImpugnacaoPenhora\SISBAJUDResource\Pages;

use App\Filament\Pages\Base\FluxoPage;
use App\Filament\Resources\Processos\ImpugnacaoPenhora\SISBAJUDResource;
use App\Models\Fluxo;
use Illuminate\Database\Eloquent\Builder;

class CreateSISBAJUD extends FluxoPage 
{
    protected static string $resource = SISBAJUDResource::class;

    protected static string $view = 'filament.resources.processos.impugnacaopenhora.sisbajud.create';
    
    protected static ?string $title = 'Impugnação à Penhora - SISBAJUD';

    public $selectedOption = null;
    
    protected function getFluxoQuery(): Builder
    {
        return Fluxo::query()->whereBetween('id', [27, 35]);
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