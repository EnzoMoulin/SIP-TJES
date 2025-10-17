<?php

namespace App\Filament\Resources\Processos\PeticaoInicial\MinutarDecisaoInicialUrgenciaResource\Pages;

use App\Filament\Pages\Base\FluxoPage;
use App\Filament\Resources\Processos\PeticaoInicial\MinutarDecisaoInicialUrgenciaResource;
use App\Models\Fluxo;
use App\Models\Modelo;
use Filament\Notifications\Notification;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\DB;

class CreateMinutarDecisaoInicialUrgencia extends FluxoPage
{
    protected static string $resource = MinutarDecisaoInicialUrgenciaResource::class;
    protected static string $view = 'filament.resources.processos.peticao-inicial.minutar-decisao-inicial-urgencia.create';
    protected static ?string $title = 'Minutar Decisão Inicial Urgência';

    // Fluxos que usam a label personalizada "Continuar" quando respondidos com "Sim"
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
        if (in_array($fluxoId, self::FLUXO_IDS_CONTINUAR, true)) {
            return 'Continuar';
        }

        return null;
    }

    public function selectOption(string $option): void
    {
        if ($this->currentId === null) {
            Notification::make()->title('Erro de Fluxo')->body('ID de pergunta atual nulo.')->danger()->send();
            return;
        }

        // 1. Lógica Customizada para "Continuar" (salto de fluxo)
        if (in_array($this->currentId, self::FLUXO_IDS_CONTINUAR, true) && mb_strtolower($option) === 'sim') {
            $nextIdRaw = $this->fluxos[$this->currentId]['nao'] ?? null;
            $nextId = $nextIdRaw !== null ? (int) $nextIdRaw : null;

            if ($nextId && isset($this->fluxos[$nextId])) {
                $this->responses[$this->currentId] = $this->getCustomActionLabel($this->currentId);
                $this->history[] = $this->currentId;
                $this->currentId = $nextId;
                $this->selectedOption = null;
                // Força a re-renderização para garantir a atualização
                $this->dispatch('refreshComponent'); 
                return;
            }
        }

        // 2. Lógica Padrão (Chama a classe pai FluxoPage)
        $this->selectedOption = $option;
        
        // Chamada principal que deve avançar o fluxo no componente pai
        parent::selectOption($option);
        
        // Dispara o evento de reset para o Alpine
        $this->dispatch('reset-selection');
    }

    public function openModeloOnly(int $fluxoId): void
    {
        $modeloIdFromFluxoTable = $this->fluxos[$fluxoId]['modelo'] ?? null;
        
        if (!$modeloIdFromFluxoTable) {
            Notification::make()->title('Este passo não tem um modelo associado.')->warning()->send();
            return;
        }

        $modelo = null;
        $targetModeloId = null;

        // Correção de Mapeamento Específico:
        // O Fluxo ID 10 (Modelo Pessoa Física) tem fluxo.modelo = 16.
        // O Modelo ID 17 (Intimação - Pessoa Física) é o que deve ser aberto.
        // Se a coluna fluxo.modelo armazena o ID 16, procuramos pelo ID 17.
        if ((int)$modeloIdFromFluxoTable === 16) {
            // Se o fluxo ID é 10 e o modelo é 16 (referente a Intimação PF),
            // Forçamos a busca pelo ID correto na tabela 'modelo'.
            $targetModeloId = 17; 
        } elseif ((int)$modeloIdFromFluxoTable === 17) {
            // Se o fluxo ID é 11 (Modelo Pessoa Jurídica) e o modelo é 17, 
            // forçamos a busca pelo ID 18 (referente a Intimação PJ - deduzindo o próximo ID sequencial).
            // NOTA: Baseado no seu print, este seria o modelo 18 Intimação PJ (ID 18).
            $targetModeloId = 18; 
        }
        
        if ($targetModeloId) {
             // Busca pelo ID PRIMÁRIO correto (ex: 17)
             $modelo = Modelo::find($targetModeloId);
        } else {
             // Fallback: Busca pelo ID direto que estava na tabela 'fluxo'
             $modelo = Modelo::find($modeloIdFromFluxoTable);
        }
        
        if (!$modelo) {
            // Se falhar, tentamos a busca pelo fluxo_id
            $modelo = Modelo::where('fluxo_id', $modeloIdFromFluxoTable)->first();
        }

        if (!$modelo) {
            Notification::make()->title("Erro: Modelo não encontrado para o ID: {$modeloIdFromFluxoTable} ou Fluxo ID: {$fluxoId}.")->warning()->send();
            return;
        }

        $url = null;

        if (Route::has('modelo.show')) {
            try {
                if (!empty($modelo->slug)) {
                    $url = route('modelo.show', ['slug' => $modelo->slug]);
                } else {
                    $url = route('modelo.show', ['id' => $modelo->id]);
                }
            } catch (\Throwable $e) {
                $url = null;
            }
        } elseif (Route::has('modelos.show')) {
            try {
                if (!empty($modelo->slug)) {
                    $url = route('modelos.show', ['slug' => $modelo->slug]);
                } else {
                    $url = route('modelos.show', ['id' => $modelo->id]);
                }
            } catch (\Throwable $e) {
                $url = null;
            }
        }

        // se ainda sem URL, tenta campos conhecidos no modelo
        if (!$url) {
            if (!empty($modelo->url) && preg_match('#^https?://#i', $modelo->url)) {
                $url = $modelo->url;
            } elseif (!empty($modelo->path)) {
                $url = Storage::url($modelo->path);
            } elseif (!empty($modelo->file)) {
                $url = Storage::url($modelo->file);
            } else {
                // fallback genérico para painel admin
                $url = url('/admin/modelos/' . $modelo->id);
            }
        }

        if (!$url) {
            Notification::make()->title('Não foi possível determinar a URL do modelo.')->warning()->send();
            return;
        }

        // CORREÇÃO: Usa $this->dispatch()
        $this->dispatch('open-modelo', url: $url);

        Notification::make()->title('Modelo aberto para visualização.')->success()->send();
    }

    public function goBack(): void
    {
        parent::goBack();
        $this->selectedOption = null;
        
        // Força a re-renderização após o retorno
        $this->dispatch('refreshComponent');
    }

    protected function getModeloUrlForStep(int $stepId): ?string
    {
        $fluxo = DB::table('fluxo')->where('id', $stepId)->first();

        if (!$fluxo) {
            return null;
        }

        // se o campo modelo contém uma URL absoluta
        if (!empty($fluxo->modelo) && preg_match('#^https?://#i', trim($fluxo->modelo))) {
            return trim($fluxo->modelo);
        }

        if (!empty($fluxo->modelo)) {
            // tenta localizar registro na tabela Modelos via Eloquent
            $modelo = Modelo::find($fluxo->modelo);
            if ($modelo) {
                if (!empty($modelo->slug) && Route::has('modelo.show')) {
                    try { return route('modelo.show', ['slug' => $modelo->slug]); } catch (\Throwable $e) {}
                }
                if (!empty($modelo->slug) && Route::has('modelos.show')) {
                    try { return route('modelos.show', ['slug' => $modelo->slug]); } catch (\Throwable $e) {}
                }
                if (!empty($modelo->url) && preg_match('#^https?://#i', $modelo->url)) {
                    return $modelo->url;
                }
                if (!empty($modelo->path)) {
                    return Storage::url($modelo->path);
                }
                if (!empty($modelo->file)) {
                    return Storage::url($modelo->file);
                }
                if (!empty($modelo->id)) {
                    return url('/admin/modelos/' . $modelo->id);
                }
            }

            // fallback: busca direta na tabela 'modelo'
            $modeloRec = DB::table('modelo')->where('id', $fluxo->modelo)->first();
            if (is_object($modeloRec)) {
                if (!empty($modeloRec->url) && preg_match('#^https?://#i', $modeloRec->url)) {
                    return $modeloRec->url;
                }
                if (!empty($modeloRec->path)) {
                    return Storage::url($modeloRec->path);
                }
                if (!empty($modeloRec->file)) {
                    return Storage::url($modeloRec->file);
                }
                if (!empty($modeloRec->id)) {
                    return url('/admin/modelos/' . $modeloRec->id);
                }
            }
        }

        return null;
    }

    public function openModelo(int $stepId): void
    {
        $url = $this->getModeloUrlForStep($stepId);

        if (empty($url)) {
            Notification::make()->title('Modelo não encontrado para este passo.')->warning()->send();
            return;
        }

        // CORREÇÃO: Usa $this->dispatch() em vez de $this->emit()
        $this->dispatch('open-modelo', url: $url);
    }
}