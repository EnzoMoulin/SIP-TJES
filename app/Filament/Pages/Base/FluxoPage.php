<?php

namespace App\Filament\Pages\Base;

use App\Models\Fluxo;
use App\Models\Modelo;
use Filament\Actions\Concerns\InteractsWithActions;
use Filament\Actions\Contracts\HasActions;
use Filament\Notifications\Notification;
use Filament\Resources\Pages\Page;
use Filament\Pages\Dashboard;
use Illuminate\Database\Eloquent\Builder;

abstract class FluxoPage extends Page implements HasActions
{
    use InteractsWithActions;

    // ... (todas as propriedades continuam iguais)
    public array $fluxos = [];
    public ?int $currentId = null;
    public array $responses = [];
    public array $history = [];
    public bool $isFinalStep = false;
    public array $summaryData = [];
    public ?int $finalFluxoId = null;
    public bool $finalStepHasModelo = false;
    public bool $isComplete = false;

    // MÉTODO ABSTRATO ATUALIZADO: Agora espera uma Query do Eloquent
    abstract protected function getFluxoQuery(): Builder;

    // MÉTODO MOUNT ATUALIZADO: Agora executa a query recebida
    public function mount(): void
    {
        // Pega a query customizada da classe filha e a executa
        $collection = $this->getFluxoQuery()
            ->orderBy('id')
            ->get()
            ->keyBy('id');

        $this->fluxos = $collection->map(fn($item) => $item->toArray())->toArray();
        $keys = array_keys($this->fluxos);
        $this->currentId = count($keys) ? (int) $keys[0] : null;
    }


    public function selectOption(string $option): void
    {
        if ($this->currentId === null) return;
        
        $currentIdBefore = $this->currentId; // Guarda o ID atual para checagem
        
        $this->responses[$this->currentId] = $option;
        $nextIdRaw = $this->fluxos[$this->currentId][strtolower($option)] ?? null;
        $nextId = $nextIdRaw !== null ? (int)$nextIdRaw : null;

        if ($nextId && isset($this->fluxos[$nextId])) {
            $this->history[] = $this->currentId;
            $this->currentId = $nextId;
        } else {
            $this->finalFluxoId = $this->currentId;
            $this->prepareSummary();
        }
        
        if ($this->currentId !== $currentIdBefore || isset($this->finalFluxoId)) {
            // DISPARA OS DOIS EVENTOS: refresh (para Livewire) e reset-selection (para Alpine)
            $this->dispatch('refreshComponent');
            $this->dispatch('reset-selection'); // <<< NOVO DISPATCH AQUI
        }
    }

    public function prepareSummary(): void
    {
        $this->summaryData = [];
        foreach ($this->responses as $questionId => $answer) {
            $this->summaryData[] = ['question' => $this->fluxos[$questionId]['pergunta'] ?? '—', 'answer' => $answer];
        }
        if ($this->finalFluxoId) {
            $this->finalStepHasModelo = isset($this->fluxos[$this->finalFluxoId]['modelo']);
        }
        $this->isFinalStep = true;
    }

    public function goBack(): void
    {
        if ($this->isFinalStep) {
            $this->isFinalStep = false;
            $this->currentId = end($this->history) ?: null;
            return;
        }
        $lastId = array_pop($this->history);
        if ($lastId) {
            unset($this->responses[$this->currentId]);
            $this->currentId = $lastId;
        }
    }

    public function finalizeAndOpenModelo(?int $fluxoId = null): void
    {
        $finalId = $fluxoId ?? $this->finalFluxoId;
        if ($finalId === null) {
            Notification::make()->title('Erro: ID do fluxo final não encontrado.')->danger()->send();
            return;
        }
        $modeloId = $this->fluxos[$finalId]['modelo'] ?? null;
        if ($modeloId === null) {
            $this->finalizeOnly();
            return;
        }

        $modelo = Modelo::where('fluxo_id', $modeloId)->first();
        if (!$modelo) {
            Notification::make()->title("Modelo correspondente ao fluxo ID {$modeloId} não encontrado.")->warning()->send();
            $this->finalizeOnly();
            return;
        }

        $url = route('modelo.show', ['slug' => $modelo->slug]);
        $this->dispatch('open-modelo', url: $url);
        $this->isComplete = true;
    }

    public function finalizeOnly(): void
    {
        Notification::make()->title('Fluxo concluído e salvo com sucesso!')->success()->send();
        $this->isComplete = true;
    }

    public function openPreviewModelo(int $fluxoId): void
    {
        $modeloId = $this->fluxos[$fluxoId]['modelo'] ?? null;
        if (!$modeloId) {
            Notification::make()->title('Este passo não tem um modelo associado.')->warning()->send();
            return;
        }
        $modelo = Modelo::where('fluxo_id', $modeloId)->first();
        if (!$modelo) {
            Notification::make()->title("Modelo correspondente ao fluxo ID {$modeloId} não encontrado.")->warning()->send();
            return;
        }
        $url = route('modelo.show', ['slug' => $modelo->slug]);
        $this->dispatch('open-modelo', url: $url);
    }

    public function resetState(): void
    {
        $this->reset();
        $this->mount();
    }
}