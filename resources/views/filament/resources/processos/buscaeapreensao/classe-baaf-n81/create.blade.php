<x-filament-panels::page>

    <style>
        :root {
            --bottom-panel-height: 750px; /* ajuste esse valor se o painel for maior/menor */
        }

        /* ---------- Buttons & core styles (harmonizados com o arquivo base) ---------- */
        .base-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
            padding: 0.75rem 1.5rem;
            font-size: 1rem;
            font-weight: 600;
            border-radius: 0.75rem;
            box-shadow: 0 4px 6px -1px rgba(0,0,0,0.1), 0 2px 4px -1px rgba(0,0,0,0.06);
            transition: all 0.15s ease-in-out;
            cursor: pointer;
            min-width: 160px;
            background-clip: padding-box;
            line-height: 1;
        }
        .base-btn:hover { transform: translateY(-2px); }
        .base-btn:focus { outline: none; box-shadow: 0 0 0 4px rgba(0,123,255,0.18); }

        .btn-primary {
            background: linear-gradient(90deg,#0056b3,#007BFF);
            color: #fff;
            border: none;
            box-shadow: 0 8px 20px rgba(0,123,255,0.22);
        }
        .btn-secondary {
            background: linear-gradient(90deg,#b45309,#f59e0b);
            color: #fff;
            border: none;
            box-shadow: 0 8px 20px rgba(180,80,20,0.22);
        }
        .btn-ghost {
            background-color: #fff;
            color: #374151;
            border: 1px solid #e5e7eb;
            box-shadow: 0 1px 2px 0 rgba(0,0,0,0.04);
        }
        .btn-ghost:hover {
            background-color: #f9fafb;
            color: #1f2937;
            transform: translateY(-2px);
        }

        .finalize-btn {
            display: inline-grid;
            grid-template-columns: auto 1fr;
            gap: 0.75rem;
            align-items: center;
            padding: 0.55rem 1rem;
            font-size: 0.95rem;
            min-width: 160px;
            max-width: 260px;
            border-radius: 0.75rem;
            background: linear-gradient(90deg,#f59e0b,#f97316);
            color: #fff;
            border: 0;
            box-shadow: 0 8px 20px rgba(245,158,11,0.18);
            cursor: pointer;
            background-clip: padding-box;
            line-height: 1.05;
        }
        .finalize-btn:focus { outline: none; box-shadow: 0 0 0 4px rgba(245,158,11,0.12); }
        .finalize-btn:hover { transform: translateY(-2px); }
        .finalize-btn .finalize-btn-icon {
            width: 2rem;
            height: 2rem;
            display: inline-flex;
            align-items: center;
            justify-content: center;
        }
        .finalize-btn .finalize-text {
            display: block;
            text-align: left;
            white-space: normal;
        }
        .finalize-btn .finalize-text .small,
        .finalize-btn .finalize-text .muted {
            display: block;
            font-size: 0.95rem;
            line-height: 1.05;
            opacity: 0.92;
        }
        .finalize-btn .finalize-text .small { font-weight: 500; }
        .finalize-btn .finalize-text .muted { font-weight: 750; }

        .option-group {
            display: inline-flex;
            border-radius: 0.75rem;
            overflow: visible;
            align-items: stretch;
        }
        .option-group > button,
        .option-group-btn {
            padding: 0.75rem 1.25rem;
            font-size: 1rem;
            font-weight: 600;
            transition: all 0.12s ease-in-out;
            min-width: 96px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
            border: 0;
            border-radius: 0;
            cursor: pointer;
            line-height: 1;
        }
        .option-group > button + button { box-shadow: inset 1px 0 0 rgba(0,0,0,0.04); }
        .option-group > button:first-child { border-radius: 0.75rem 0 0 0.75rem; }
        .option-group > button:last-child { border-radius: 0 0.75rem 0.75rem 0; }

        .option-group > .option-group-btn-inactive,
        .option-group > button.option-group-btn-inactive {
            background-color: #fff !important;
            color: #374151 !important;
            border: 1px solid #e6e6e6;
            box-shadow: 0 1px 2px rgba(0,0,0,0.04);
        }
        .option-group > .option-group-btn-inactive:hover {
            background-color: #f8fafc !important;
            color: #1f2937 !important;
            transform: translateY(-2px);
        }
        .option-group > .option-group-btn-active,
        .option-group > button.option-group-btn-active {
            background: linear-gradient(90deg,#f59e0b,#f97316) !important;
            color: #fff !important;
            border: 1px solid rgba(0,0,0,0.04);
            box-shadow: 0 8px 18px rgba(245,158,11,0.18);
            transform: translateY(-2px);
        }
        .option-group svg { stroke: currentColor; fill: none; width: 20px; height: 20px; }

        /* icon colors */
        .icon-sim { color: #16a34a; }
        .icon-nao { color: #dc2626; }
        .icon-voltar { color: #dc2626; } /* seta vermelha */

        /* Voltar button — texto neutro, ícone vermelho */
        .option-group > button.btn-voltar {
            border-radius: 0.75rem !important;
            background-color: #fff !important;
            color: #374151 !important;
            border: 1px solid #e6e6e6 !important;
            box-shadow: 0 1px 2px rgba(0,0,0,0.04);
            transition: all 0.12s ease-in-out;
        }
        .option-group > button.btn-voltar:hover {
            background-color: #f8fafc !important;
            color: #1f2937 !important;
            transform: translateY(-2px);
        }

        /* ---------- Cards & layout ---------- */
        .form-card {
            width: 100%;
            max-width: 920px;
            position: relative;
            border-radius: 1.25rem;
            overflow: visible;
            margin: 0 auto;
            box-shadow: 0 18px 40px rgba(2,6,23,0.45);
        }
        .form-card-inner {
            background-color: #0C0A39;
            color: #fff;
            border-radius: 1.25rem;
            overflow: hidden;
            border: 1px solid rgba(255,255,255,0.06);
            padding: 1.5rem 11rem 2rem 1.5rem;
            position: relative;
            box-sizing: border-box;
        }
        .form-card-logo {
            position: absolute;
            top: 1.25rem;
            right: 1.25rem;
            z-index: 20;
            pointer-events: none;
        }
        .form-card-logo img { height: 48px; width: auto; display: block; }

        .completion-card {
            width: min(1100px, 94%);
            background-color: #f3f4f6;
            padding: 2.5rem 3rem;
            border-radius: 1.75rem;
            box-shadow: 0 28px 60px rgba(2,6,23,0.28);
            border: 1px solid rgba(245,158,11,0.12);
            text-align: center;
            margin: auto 0;
        }
        .completion-card h2 { font-size: 2rem; font-weight: 800; color: #1f2937; margin-bottom: 0.25rem; }
        .completion-card p { color: #4b5563; margin-top: 0.5rem; }

        /* ---------- Page container centered (form centered vertically excluding bottom panel) ---------- */
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
            overflow: auto;
        }
        .fi-layout-panel {
            height: 100% !important;
            display: flex !important;
            flex-direction: column !important;
            justify-content: center !important;
            align-items: center !important;
            overflow-y: auto !important;
            padding: 0 !important;
            margin: 0 !important;
        }

        /* Center the form in the available space above the bottom panel */
        .page-container {
            width: 100%;
            min-height: calc(100vh - var(--bottom-panel-height));
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center; /* center vertically in remaining space */
            padding: 1rem;
            box-sizing: border-box;
            position: relative;
            gap: 1.25rem;
        }
        .form-card, .completion-card { margin-top: 0; margin-bottom: 0; }

        /* ---------- Bottom panel (fixo e centralizado) ---------- */
        .bottom-panel {
            position: fixed;
            left: 55%;
            transform: translateX(-50%);
            bottom: 1.5rem;
            z-index: 60;
            width: calc(100% - 4rem);
            max-width: 1400px;
            pointer-events: none; /* avoid capturing clicks outside cards */
        }
        .bottom-panel .inner {
            display: flex;
            gap: 1rem;
            align-items: flex-end;
            justify-content: space-between;
            pointer-events: auto; /* enable clicks inside the inner */
        }

        /* cards dentro do painel */
        .bottom-panel .card {
            background: rgba(255,255,255,0.96);
            border-radius: 1rem;
            padding: 0.85rem;
            box-shadow: 0 18px 40px rgba(2,6,23,0.08);
            border: 1px solid rgba(15,23,42,0.06);
            display: flex;
            flex-direction: column;
            gap: 0.5rem;
        }

        /* largura: resumo mais estreito, info maior, competência médio */
        .bottom-panel .card.summary { width: 360px; max-width: 38%; }
        .bottom-panel .card.info { flex: 1 1 520px; min-width: 300px; }
        .bottom-panel .card.competence { width: 260px; }

        /* Summary styling */
        .summary .summary-header { display:flex; align-items:center; justify-content:space-between; gap:0.5rem; margin-bottom:0.5rem; }
        .summary .summary-title h3 { margin:0; font-size:1.05rem; font-weight:700; color:#0f172a; }
        .summary .summary-count { font-size:0.85rem; color:#475569; background: rgba(15,23,42,0.04); padding:0.2rem 0.5rem; border-radius:999px; font-weight:600; }

        .summary .summary-list { max-height: 30vh; overflow-y:auto; padding-right:0.25rem; }
        .summary .summary-list ol { margin:0; padding:0; list-style:none; display:flex; flex-direction:column; gap:0.6rem; }
        .summary .summary-item { display:flex; gap:0.6rem; align-items:flex-start; padding:0.55rem; border-radius:0.6rem; transition:background .12s ease, transform .08s ease; }
        .summary .summary-item:hover { background: rgba(2,6,23,0.02); transform: translateY(-2px); }
        .summary .summary-item .q { flex:1 1 auto; color:#0f172a; font-weight:600; font-size:0.95rem; line-height:1.15; }
        .summary .summary-item .a { flex:0 0 auto; align-self:center; font-size:0.9rem; font-weight:700; padding:0.28rem 0.5rem; border-radius:999px; text-transform:uppercase; width:3.5rem; text-align:center; }
        .pill-sim { background: #ecfdf5; color: #065f46; }
        .pill-nao { background: #fff1f2; color: #991b1b; }
        .pill-otro { background: #eef2ff; color: #3730a3; }

        /* Info card inner grid nicer look */
        .info-row {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 0.6rem;
        }
        .info-field {
            background: linear-gradient(180deg,#fff,#fbfbfd);
            border-radius: 0.75rem;
            padding: 0.65rem 0.75rem;
            display: flex;
            gap: 0.6rem;
            align-items: center;
            border: 1px solid rgba(15,23,42,0.04);
        }
        .info-field .label { font-size: 0.78rem; color: #475569; font-weight:700; }
        .info-field .value { font-weight:700; color:#0f172a; font-size:0.95rem; }

        /* competence card */
        .competence .label { font-size: 0.85rem; color: #475569; font-weight:700; margin-bottom: 0.35rem; display:flex; gap:0.5rem; align-items:center; }
        .competence select { width:100%; padding:0.5rem 0.75rem; border-radius:0.6rem; border:1px solid rgba(15,23,42,0.06); background:#fff; font-weight:700; }

        /* responsive: empilha em mobile */
        @media (max-width: 920px) {
            .bottom-panel { left: 1rem; right: 1rem; transform: none; width: calc(100% - 2rem); }
            .bottom-panel .inner { flex-direction: column-reverse; gap: 0.6rem; align-items: stretch; }
            .bottom-panel .card.summary, .bottom-panel .card.info, .bottom-panel .card.competence { width: 100%; }
            .info-row { grid-template-columns: 1fr; }
        }
    </style>

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
                <div class="form-card mx-auto" role="main" aria-live="polite">
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
                                            <button type="button" wire:click="goBack" class="option-group-btn btn-voltar" aria-label="Voltar">
                                                <svg class="icon-voltar" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3">
                                                    <path stroke-linecap="round" stroke-linejoin="round" d="M11 17l-5-5m0 0l5-5m-5 5h12" />
                                                </svg>
                                                <span>Voltar</span>
                                            </button>
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

        {{-- BOTTOM-PANEL (Resumo | Info | Competência) — renderiza somente quando NÃO é tela de conclusão --}}
        @unless ($isComplete)
        <div class="bottom-panel" aria-hidden="false">
            <div class="inner">
                <!-- SUMMARY CARD -->
                <div class="card summary" x-data="{ openSummary: true }">
                    <div class="summary-header">
                        <div class="summary-title">
                            <h3>Resumo das Respostas</h3>
                            <span class="summary-count">{{ count($history ?? []) }}</span>
                        </div>

                        <div class="summary-controls">
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

                    <div class="summary-list" x-show="openSummary" x-transition:enter="transition ease-out duration-200" x-transition:enter-start="opacity-0 transform -translate-y-2" x-transition:enter-end="opacity-100 transform translate-y-0" x-transition:leave="transition ease-in duration-160" x-transition:leave-start="opacity-100 transform translate-y-0" x-transition:leave-end="opacity-0 transform -translate-y-2">
                        <ol>
                            <?php
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
                                } else {
                                    echo '<div class="text-sm text-gray-500">Nenhuma resposta ainda.</div>';
                                }
                            ?>
                        </ol>
                    </div>
                </div>

                <!-- INFO BAR (centro) -->
                <div class="card info" role="region" aria-label="Informações do processo">
                    <div class="info-row">
                        <div class="info-field" title="Data">
                            <svg class="info-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="currentColor">
                                <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
                                <line x1="16" y1="2" x2="16" y2="6"></line>
                                <line x1="8" y1="2" x2="8" y2="6"></line>
                            </svg>
                            <div>
                                <div class="label">Data</div>
                                <div class="value">{{ now()->format('d/m/Y') }}</div>
                            </div>
                        </div>

                        <div class="info-field" title="Hora">
                            <svg class="info-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="currentColor">
                                <circle cx="12" cy="12" r="10"></circle>
                                <polyline points="12 6 12 12 16 14"></polyline>
                            </svg>
                            <div>
                                <div class="label">Hora</div>
                                <div class="value">{{ now()->format('H:i') }}</div>
                            </div>
                        </div>

                        <div class="info-field" title="Tarefa">
                            <svg class="info-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="currentColor">
                                <path d="M3 7h18"></path>
                                <path d="M3 12h18"></path>
                                <path d="M3 17h18"></path>
                            </svg>
                            <div>
                                <div class="label">Tarefa</div>
                                <div class="value">{{ $this->getHeading() }}</div>
                            </div>
                        </div>
                    </div>

                    <div style="height:8px;"></div>

                    <div class="info-row">
                        <div class="info-field" title="Nº do Processo">
                            <svg class="info-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="currentColor">
                                <path d="M12 1v22"></path>
                                <circle cx="12" cy="8" r="4"></circle>
                            </svg>
                            <div>
                                <div class="label">Nº do Processo</div>
                                <div class="value">00000000000000000000</div>
                            </div>
                        </div>

                        <div class="info-field" title="Competência">
                            <svg class="info-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="currentColor">
                                <path d="M10 21v-6"></path>
                                <path d="M14 21v-6"></path>
                                <path d="M3 7h18"></path>
                            </svg>
                            <div>
                                <div class="label">Competência</div>
                                <div class="value">{{ ucfirst($competencia ?? 'Cível') }}</div>
                            </div>
                        </div>

                        <div class="info-field" title="Usuário">
                            <svg class="info-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="currentColor">
                                <path d="M20 21v-2a4 4 0 00-4-4H8a4 4 0 00-4 4v2"></path>
                                <circle cx="12" cy="7" r="4"></circle>
                            </svg>
                            <div>
                                <div class="label">Usuário</div>
                                <div class="value">{{ auth()->user()->name ?? 'Usuário' }}</div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- COMPETENCE / SELECT (direita) -->
                <div class="card competence">
                    <div class="label">
                        <svg class="info-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor">
                            <path d="M3 7h18"></path>
                            <path d="M3 12h18"></path>
                        </svg>
                        Selecionar Competência
                    </div>

                    <!-- Apenas Cível e Criminal -->
                    <select wire:model="competencia" aria-label="Selecionar competência">
                        <option value="cível" {{ (strtolower($competencia ?? '')=='cível' || strtolower($competencia ?? '')=='civel') ? 'selected' : '' }}>Cível</option>
                        <option value="criminal" {{ (strtolower($competencia ?? '')=='criminal') ? 'selected' : '' }}>Criminal</option>
                    </select>

                    <div style="height:6px;"></div>
                    <div class="text-xs text-gray-500">Altere a competência quando necessário — a seleção será aplicada ao processo.</div>
                </div>
            </div>
        </div>
        @endunless

    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            function updateHora() {
                let valueEl = null;
                const bottomPanel = document.querySelector('.bottom-panel');
                if (bottomPanel) {
                    valueEl = bottomPanel.querySelector('.info-field[title="Hora"] .value');
                }
                if (!valueEl) {
                    valueEl = document.querySelector('.info-field[title="Hora"] .value');
                }
                if (valueEl) {
                    const now = new Date();
                    const hh = String(now.getHours()).padStart(2,'0');
                    const mm = String(now.getMinutes()).padStart(2,'0');
                    valueEl.textContent = `${hh}:${mm}`;
                }
            }
            updateHora(); // inicial
            setInterval(updateHora, 60000);
        });
    </script>

</x-filament-panels::page>