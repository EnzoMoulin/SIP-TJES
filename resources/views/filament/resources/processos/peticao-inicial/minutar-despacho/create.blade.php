<x-filament-panels::page>

    <style>
        .base-btn { display: inline-flex; align-items: center; justify-content: center; gap: 0.5rem; padding: 0.75rem 1.5rem; font-size: 1rem; font-weight: 600; border-radius: 0.75rem; box-shadow: 0 4px 6px -1px rgba(0,0,0,0.1), 0 2px 4px -1px rgba(0,0,0,0.06); transition: all 0.15s ease-in-out; cursor: pointer; min-width: 160px; background-clip: padding-box; line-height: 1; }
        .base-btn:hover { transform: translateY(-2px); }
        .base-btn:focus { outline: none; box-shadow: 0 0 0 4px rgba(0,123,255,0.18); }
        .btn-primary { background: linear-gradient(90deg,#0056b3,#007BFF); color: #fff; border: none; box-shadow: 0 8px 20px rgba(0,123,255,0.22); }
        .btn-secondary { background: linear-gradient(90deg,#b45309,#f59e0b); color: #fff; border: none; box-shadow: 0 8px 20px rgba(180,80,20,0.22); }
        .btn-ghost { background-color: #fff; color: #374151; border: 1px solid #e5e7eb; box-shadow: 0 1px 2px 0 rgba(0,0,0,0.04); }
        .btn-ghost:hover { background-color: #f9fafb; color: #1f2937; transform: translateY(-2px); box-shadow: 0 6px 18px rgba(0,0,0,0.06); }
        .finalize-btn { display: inline-grid; grid-template-columns: auto 1fr; gap: 0.75rem; align-items: center; padding: 0.55rem 1rem; font-size: 0.95rem; min-width: 160px; max-width: 260px; border-radius: 0.75rem; background: linear-gradient(90deg,#f59e0b,#f97316); color: #fff; border: 0; box-shadow: 0 8px 20px rgba(245,158,11,0.18); cursor: pointer; background-clip: padding-box; line-height: 1.05; }
        .finalize-btn:focus { outline: none; box-shadow: 0 0 0 4px rgba(245,158,11,0.12); }
        .finalize-btn:hover { transform: translateY(-2px); }
        .finalize-btn .finalize-btn-icon { width: 2rem; height: 2rem; display: inline-flex; align-items: center; justify-content: center; }
        .finalize-btn .finalize-text { text-align: left; display: block; white-space: normal; }
        .finalize-btn .finalize-text .small { display: block; font-weight: 500; font-size: 0.95rem; opacity: 0.92; line-height: 1.05; }
        .finalize-btn .finalize-text .muted { display: block; font-weight: 750; font-size: 0.95rem; opacity: 0.92; line-height: 1.05; }
        .option-group { display: inline-flex; border-radius: 0.75rem; overflow: visible; align-items: stretch; }
        .option-group > button, .option-group-btn { padding: 0.75rem 1.25rem; font-size: 1rem; font-weight: 600; transition: all 0.12s ease-in-out; min-width: 96px; display: inline-flex; align-items: center; justify-content: center; gap: 0.5rem; border: 0; border-radius: 0; cursor: pointer; line-height: 1; }
        .option-group > button + button { box-shadow: inset 1px 0 0 rgba(0,0,0,0.04); }
        .option-group > button:first-child { border-top-left-radius: 0.75rem; border-bottom-left-radius: 0.75rem; }
        .option-group > button:last-child { border-top-right-radius: 0.75rem; border-bottom-right-radius: 0.75rem; }
        .option-group > button.option-group-btn-inactive, .option-group > .option-group-btn-inactive { background-color: #fff !important; color: #374151 !important; border: 1px solid #e6e6e6; box-shadow: 0 1px 2px rgba(0,0,0,0.04); }
        .option-group > button.option-group-btn-inactive:hover { background-color: #f8fafc !important; transform: translateY(-2px); }
        .option-group > button.option-group-btn-active, .option-group > .option-group-btn-active { background: linear-gradient(90deg,#f59e0b,#f97316) !important; color: #fff !important; border: 1px solid rgba(0,0,0,0.04); box-shadow: 0 8px 18px rgba(245,158,11,0.18); transform: translateY(-2px); }
        .option-group svg { stroke: currentColor; fill: none; }
        .icon-sim { color: #16a34a; }
        .icon-nao { color: #dc2626; }
        .form-card { width: 100%; max-width: 920px; position: relative; border-radius: 1.25rem; overflow: visible; box-shadow: 0 18px 40px rgba(2,6,23,0.45); }
        .form-card-inner { background-color: #0C0A39; color: #fff; border-radius: 1.25rem; overflow: hidden; border: 1px solid rgba(255,255,255,0.06); padding: 1.5rem 11rem 2rem 1.5rem; box-sizing: border-box; position: relative; }
        .form-card-logo { position: absolute; top: 1.25rem; right: 1.25rem; z-index: 20; pointer-events: none; }
        .form-card-logo img { height: 48px; width: auto; display: block; }
        .completion-card { width: min(1100px, 94%); background-color: #f3f4f6; padding: 2.5rem 3rem; border-radius: 1.75rem; box-shadow: 0 28px 60px rgba(2,6,23,0.28); border: 1px solid rgba(245,158,11,0.12); text-align: center; }
        .completion-card h2 { font-size: 2rem; font-weight: 800; color: #1f2937; margin-bottom: 0.25rem; }
        .completion-card p { color: #4b5563; margin-top: 0.5rem; }
        @media (max-width: 920px) { .completion-card { padding: 2rem; width: min(820px, 94%); border-radius: 1.25rem; } .completion-card h2 { font-size: 1.6rem; } }
        @media (max-width: 480px) { .completion-card { padding: 1.25rem; width: calc(100% - 2rem); border-radius: 1rem; } .completion-card h2 { font-size: 1.25rem; } }

        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
            overflow: hidden; /* Evita a barra de rolagem geral se o conteúdo for menor que a tela */
        }

        .fi-layout-panel { /* Este pode ser o seletor principal do seu painel de conteúdo */
            height: 100% !important;
            display: flex !important;
            flex-direction: column !important;
            justify-content: center !important; /* Centraliza verticalmente o conteúdo dentro dele */
            align-items: center !important; /* Centraliza horizontalmente */
            overflow-y: auto !important; /* Permite rolagem se o conteúdo for muito grande */
            padding: 0 !important; /* Remove padding que pode desalinhar */
            margin: 0 !important; /* Remove margin que pode desalinhar */
        }

        .page-container {
            width: 100%;
            /* min-height: 100%; Não use min-height aqui. Deixe o flexbox fazer o trabalho. */
            flex-grow: 1; /* Ocupa todo o espaço vertical disponível no flex container */
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 1rem; /* Padding para o conteúdo não colar nas bordas */
            box-sizing: border-box;
            /* Remover as regras de posição absoluta e transformação */
            position: unset;
            top: unset;
            left: unset;
            transform: unset;
        }

        .form-card, .completion-card {
            margin-top: auto; /* Empurra para o centro com flex */
            margin-bottom: auto; /* Empurra para o centro com flex */
        }

        .summary-wrapper {
            position: absolute;
            bottom: 2rem;
            left: calc(var(--fi-sidebar-width, 20rem) + 2rem);
            z-index: 50;
            width: min(380px, 88%);
            max-width: 420px;
            transition: transform .22s ease, opacity .22s ease;
            -webkit-backdrop-filter: blur(6px);
            backdrop-filter: blur(6px);
        }

        .summary-panel {
            background: rgba(255,255,255,0.92);
            border-radius: 0.9rem;
            box-shadow: 0 18px 40px rgba(2,6,23,0.12);
            border: 1px solid rgba(15,23,42,0.06);
            padding: 1rem;
            overflow: hidden;
        }

        .summary-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 0.5rem;
            margin-bottom: 0.65rem;
        }

        .summary-title {
            display: flex;
            gap: 0.5rem;
            align-items: baseline;
        }

        .summary-title h3 {
            margin: 0;
            font-size: 1.05rem;
            font-weight: 700;
            color: #0f172a;
        }

        .summary-count {
            font-size: 0.85rem;
            color: #475569;
            background: rgba(15,23,42,0.04);
            padding: 0.2rem 0.5rem;
            border-radius: 999px;
            font-weight: 600;
        }

        .summary-controls {
            display: flex;
            gap: 0.45rem;
            align-items: center;
        }

        .summary-toggle {
            background: transparent;
            border: 0;
            padding: 0.35rem;
            border-radius: 0.5rem;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            transition: background .12s ease, transform .12s ease;
        }

        .summary-toggle:hover { background: rgba(2,6,23,0.04); transform: translateY(-2px); }

        .summary-list {
            max-height: 42vh;
            overflow-y: auto;
            padding-right: 0.25rem;
        }

        .summary-list ol {
            margin: 0;
            padding: 0;
            list-style: none;
            display: flex;
            flex-direction: column;
            gap: 0.6rem;
        }

        .summary-item {
            display: flex;
            gap: 0.6rem;
            align-items: flex-start;
            padding: 0.55rem;
            border-radius: 0.6rem;
            transition: background .12s ease, transform .08s ease;
        }

        .summary-item:hover {
            background: rgba(2,6,23,0.02);
            transform: translateY(-2px);
        }

        .summary-item .q {
            flex: 1 1 auto;
            color: #0f172a;
            font-weight: 600;
            font-size: 0.95rem;
            line-height: 1.15;
        }

        .summary-item .a {
            flex: 0 0 auto;
            align-self: center;
            font-size: 0.9rem;
            font-weight: 700;
            padding: 0.28rem 0.5rem;
            border-radius: 999px;
            text-transform: uppercase;
            width: 3.5rem;
            text-align: center;
        }

        .pill-sim { background: #ecfdf5; color: #065f46; }
        .pill-nao { background: #fff1f2; color: #991b1b; }
        .pill-otro { background: #eef2ff; color: #3730a3; }

        .summary-list::-webkit-scrollbar { width: 8px; }
        .summary-list::-webkit-scrollbar-track { background: transparent; }
        .summary-list::-webkit-scrollbar-thumb { background: rgba(15,23,42,0.08); border-radius: 999px; }

        .option-group button {
            display: flex;
            align-items: center;
            justify-content: center;
            min-width: 100px;
            height: 42px;
        }

        .option-group svg {
            width: 20px;
            height: 20px;
        }

        @media (max-width: 920px) {
            .summary-wrapper {
                left: 1rem;
                right: 1rem;
                width: auto;
                max-width: calc(100% - 2rem);
                bottom: 1rem;
            }
            .summary-panel { padding: 0.75rem; }
            .summary-list { max-height: 34vh; }
        }

        @media (max-width: 480px) {
            .summary-wrapper { bottom: 0.75rem; left: 0.5rem; right: 0.5rem; }
            .summary-panel { padding: 0.6rem; border-radius: 0.75rem; }
            .summary-title h3 { font-size: 1rem; }
            .summary-item .q { font-size: 0.9rem; }
        }
    </style>

    {{-- O contêiner pai que envolve tudo dentro da página do Filament --}}
    <div x-data="{ selectedOption: @entangle('selectedOption') }"
         x-on:open-modelo.window="window.open($event.detail.url, '_blank')"
         class="page-container">

        @if ($isComplete)
            <div class="completion-card" x-transition.opacity.scale.duration.400ms>
                <div class="pt-6 flex flex-col items-center justify-center">
                    <svg class="w-16 h-16 text-green-500 mb-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"/>
                    </svg>
                    <h2>Processo Concluído!</h2>
                    <p>O fluxo foi finalizado e o modelo do documento foi gerado com sucesso.</p>
                    <div class="mt-6 flex flex-col sm:flex-row gap-4 pb-6 justify-center">
                        <a href="{{ route('filament.admin.resources.processos.peticao-inicial.minutar-decisao-inicial-urgencias.create', ['statusprocesso_id' => $statusProcessoAtual ?? 2]) }}"
                           class="base-btn btn-primary">
                            Iniciar Novo Fluxo
                        </a>
                        <a href="{{ url('/admin') }}" class="base-btn btn-secondary">Voltar para o Dashboard</a>
                    </div>
                </div>
            </div>

        @elseif ($isFinalStep)
             <div class="max-w-3xl ml-6 md:ml-12 p-8 bg-gray-100 rounded-3xl shadow-2xl border border-amber-50"
                  x-transition.opacity.duration.300ms>
                {{-- summary --}}
            </div>
        @else
            @if ($currentId && isset($fluxos[$currentId]))
                @php($currentStep = $fluxos[$currentId])
                <div class="form-card">
                    <div class="form-card-inner">
                        <div class="form-card-logo">
                            <img alt="TJES logo" src="{{ url('/images/logo.png') }}">
                        </div>
                        <div class="flex gap-6">
                            <div class="flex-1 relative">
                                @if (isset($currentStep['sim']) || isset($currentStep['nao']))
                                    <div class="text-xs font-semibold uppercase tracking-wider">
                                        Passo {{ count($history) + 1 }}
                                    </div>
                                @endif
                                <h2 class="mt-2 text-2xl md:text-3xl font-extrabold leading-tight">
                                    {{ $currentStep['pergunta'] }}
                                </h2>
                                @if(!empty($currentStep['descricao'] ?? ''))
                                    <p class="mt-2 text-sm opacity-80 font-mono">{{ $currentStep['descricao'] }}</p>
                                @endif
                                <div class="mt-6 flex items-center flex-wrap gap-3">
                                    @if (isset($currentStep['sim']) || isset($currentStep['nao']))
                                        <div role="group" class="option-group" aria-label="Opções: Sim / Não">
                                            @if (isset($currentStep['sim']))
                                                <button type="button"
                                                        @click="selectedOption = 'sim'; $wire.selectOption('sim')"
                                                        :class="selectedOption === 'sim' ? 'option-group-btn option-group-btn-active' : 'option-group-btn option-group-btn-inactive'">
                                                    <svg class="icon-sim" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3">
                                                        <path stroke-linecap="round" stroke-linejoin="round" d="M5 13l4 4L19 7" />
                                                    </svg>
                                                    <span>Sim</span>
                                                </button>
                                            @endif
                                            @if (isset($currentStep['nao']))
                                                <button type="button"
                                                        @click="selectedOption = 'nao'; $wire.selectOption('nao')"
                                                        :class="selectedOption === 'nao' ? 'option-group-btn option-group-btn-active' : 'option-group-btn option-group-btn-inactive'">
                                                    <svg class="icon-nao" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3">
                                                        <line x1="18" y1="6" x2="6" y2="18" />
                                                        <line x1="6" y1="6" x2="18" y2="18" />
                                                    </svg>
                                                    <span>Não</span>
                                                </button>
                                            @endif
                                        </div>
                                    @endif
                                    @if (!isset($currentStep['sim']) && !isset($currentStep['nao']) && isset($currentStep['modelo']))
                                        <button type="button" wire:click="finalizeAndOpenModelo({{ $currentId }})" class="finalize-btn">
                                            <svg xmlns="http://www.w3.org/2000/svg" class="finalize-btn-icon" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.8">
                                                <path stroke-linecap="round" stroke-linejoin="round" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
                                            </svg>
                                            <span class="finalize-text">
                                                <span class="small">Finalizar e</span>
                                                <span class="muted">Abrir Modelo</span>
                                            </span>
                                        </button>
                                    @elseif (!isset($currentStep['sim']) && !isset($currentStep['nao']) && !isset($currentStep['modelo']))
                                        <button type="button" wire:click="finalizeOnly()" class="base-btn btn-secondary">Finalizar e Concluir</button>
                                    @endif
                                    @if(count($history) > 0)
                                        <div role="group" class="option-group">
                                            <button type="button" wire:click="goBack" class="option-group-btn option-group-btn-inactive voltar-btn">← Voltar</button>
                                        </div>
                                    @endif
                                </div>
                                <div class="mt-6 text-xs opacity-80 font-medium font-mono flex items-center gap-2">
                                    <span class="inline-block mr-3">{{ $this->getHeading() }}</span>
                                    <span class="inline-block"> · TJES </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            @endif
        @endif

        {{-- START: Final summary block (reformulado, responsivo, recolhível) --}}
        @if (!empty($history) && count($history) > 0)
            <div x-data="{ openSummary: true }" class="summary-wrapper" x-cloak>
                <div class="summary-panel">
                    <div class="summary-header">
                        <div class="summary-title">
                            <h3>Resumo das Respostas</h3>
                            <span class="summary-count">{{ count($history) }}</span>
                        </div>

                        <div class="summary-controls">
                            {{-- Toggle botão --}}
                            <button type="button" class="summary-toggle" x-bind:title="openSummary ? 'Recolher' : 'Expandir'" @click="openSummary = !openSummary">
                                <svg x-show="!openSummary" xmlns="http://www.w3.org/2000/svg" class="w-5 h-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" />
                                </svg>
                                <svg x-show="openSummary" xmlns="http://www.w3.org/2000/svg" class="w-5 h-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 15l7-7 7 7" />
                                </svg>
                            </button>
                        </div>
                    </div>

                    {{-- Lista com transição de recolher/expandir --}}
                    <div class="summary-list" x-show="openSummary" x-transition:enter="transition ease-out duration-200" x-transition:enter-start="opacity-0 transform -translate-y-2" x-transition:enter-end="opacity-100 transform translate-y-0" x-transition:leave="transition ease-in duration-160" x-transition:leave-start="opacity-100 transform translate-y-0" x-transition:leave-end="opacity-0 transform -translate-y-2">
                        <ol>
                            <?php
                                // Loop em PHP para evitar mismatches de diretivas Blade
                                if (!empty($history) && is_array($history)) {
                                    foreach ($history as $questionId) {
                                        if (!isset($fluxos[$questionId]) || !isset($responses[$questionId])) {
                                            continue;
                                        }

                                        $responseRaw = $responses[$questionId];
                                        $answerLower = function_exists('mb_strtolower') ? mb_strtolower($responseRaw, 'UTF-8') : strtolower($responseRaw);

                                        if (in_array($answerLower, ['nao', 'não'], true)) {
                                            $normalizedResponse = 'NÃO';
                                            $pillClass = 'pill-nao';
                                        } elseif ($answerLower === 'sim') {
                                            $normalizedResponse = 'SIM';
                                            $pillClass = 'pill-sim';
                                        } else {
                                            $normalizedResponse = function_exists('mb_strtoupper') ? mb_strtoupper($responseRaw, 'UTF-8') : strtoupper($responseRaw);
                                            $pillClass = 'pill-otro';
                                        }

                                        $pergunta = isset($fluxos[$questionId]['pergunta']) ? $fluxos[$questionId]['pergunta'] : '';
                                        ?>
                                        <li class="summary-item">
                                            <div class="q"><?php echo e($pergunta); ?></div>
                                            <div class="a <?php echo $pillClass; ?>"><?php echo e($normalizedResponse); ?></div>
                                        </li>
                                        <?php
                                    }
                                }
                            ?>
                        </ol>
                    </div>
                </div>
            </div>
        @endif
        {{-- END: Final summary block --}}

    </div>

</x-filament-panels::page>