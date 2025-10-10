<?php

namespace App\Filament\Resources\Processos\BuscaeApreensao\ClasseBAAFn81Resource\Pages;

use App\Filament\Pages\Base\FluxoPage;
use App\Filament\Resources\Processos\BuscaeApreensao\ClasseBAAFn81Resource;
use App\Models\Fluxo;
use Illuminate\Database\Eloquent\Builder;

class CreateClasseBAAFn81 extends FluxoPage
{
    protected static string $resource = ClasseBAAFn81Resource::class;
    protected static string $view = 'filament.resources.processos.buscaeapreensao.classe-baaf-n81.create';
    protected static ?string $title = 'Classe - BAAF (n°81)';
    
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