<?php

namespace App\Filament\Resources\Processos\PeticaoInicial\MinutarDespachoResource\Pages;

use App\Filament\Pages\Base\FluxoPage;
use App\Filament\Resources\Processos\PeticaoInicial\MinutarDespachoResource;
use App\Models\Fluxo;
use App\Models\Modelo;
use Filament\Notifications\Notification;
use Illuminate\Database\Eloquent\Builder;

class CreateMinutarDespacho extends FluxoPage
{
    protected static string $resource = MinutarDespachoResource::class;
    protected static string $view = 'filament.resources.processos.peticao-inicial.minutar-despacho.create';
    protected static ?string $title = 'Minutar Despacho';

    public const FLUXO_IDS_CONTINUAR = [10, 11];

    public int $statusProcessoAtual;

    public $selectedOption = null;

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

    public function getCustomActionLabel(int $fluxoId): ?string
    {
        if (in_array($fluxoId, self::FLUXO_IDS_CONTINUAR)) {
            return 'Continuar';
        }

        return null;
    }

    public function selectOption(string $option): void
    {
        if ($this->currentId === null) return;

        if (in_array($this->currentId, self::FLUXO_IDS_CONTINUAR) && strtolower($option) === 'sim') {
            
            $nextIdRaw = $this->fluxos[$this->currentId]['nao'] ?? null; 
            $nextId = $nextIdRaw !== null ? (int)$nextIdRaw : null;
            
            if ($nextId && isset($this->fluxos[$nextId])) {
                $this->responses[$this->currentId] = $this->getCustomActionLabel($this->currentId);
                $this->history[] = $this->currentId;
                $this->currentId = $nextId;
                $this->selectedOption = null;
                return;
            }
        }

        $this->selectedOption = $option;
        parent::selectOption($option);
        $this->selectedOption = null;
    }

    public function openModeloOnly(int $fluxoId): void
    {
        $modeloFluxoId = $this->fluxos[$fluxoId]['modelo'] ?? null;

        if (!$modeloFluxoId) {
            Notification::make()->title('Este passo não tem um modelo associado.')->warning()->send();
            return;
        }

        $modelo = Modelo::where('fluxo_id', $modeloFluxoId)->first();

        if (!$modelo) {
            Notification::make()->title("Erro: Modelo não encontrado para o ID de Fluxo: {$modeloFluxoId}.")->warning()->send();
            return;
        }

        $url = route('modelo.show', ['slug' => $modelo->slug]);

        $this->dispatch('open-modelo', url: $url);

        Notification::make()->title('Modelo aberto para visualização.')->success()->send();
    }

    public function goBack(): void
    {
        parent::goBack();
        $this->selectedOption = null;
    }
}