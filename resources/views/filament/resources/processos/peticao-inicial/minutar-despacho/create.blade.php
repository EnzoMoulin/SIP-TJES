<?php
// Variáveis PHP complexas movidas para o topo do arquivo Blade para melhor escopo
$currentStep = $fluxos[$currentId] ?? [];
$questionNormalized = function_exists('mb_strtolower') ? mb_strtolower(trim($currentStep['pergunta'] ?? ''), 'UTF-8') : strtolower(trim($currentStep['pergunta'] ?? ''));
$modeloPessoaVariants = [
    'modelo pessoa física',
    'modelo pessoa fisica',
    'modelo pessoa fí­sica',
    'modelo pessoa jurídica',
    'modelo pessoa juridica',
    'modelo pessoa jurídica',
];
$isModeloPessoaStep = isset($currentStep['modelo']) && in_array($questionNormalized, $modeloPessoaVariants, true);
?>

<x-filament-panels::page><div x-data="{ selectedOption: @entangle('selectedOption') }"
     x-on:open-modelo.window="window.open($event.detail.url, '_blank')"
     x-on:reset-selection.window="selectedOption = null"
     class="page-container">

    <style>
        :root {
            --bottom-panel-height: 750px;
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
            height: 48px;
        }
        .base-btn:hover { transform: translateY(-2px); }
        .base-btn:focus { outline: none; box-shadow: 0 0 0 4px rgba(0,123,255,0.18); }

        .btn-same-size {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
            min-width: 120px;
            height: 48px;
            padding: 0 1.25rem !important;
            box-sizing: border-box;
            line-height: 1;
        }
        
        .btn-primary {
            background: linear-gradient(90deg,#0056b3,#007BFF);
            color: #fff;
            border: 0;
            box-shadow: 0 8px 20px rgba(0,123,255,0.22);
        }
        .btn-secondary {
            background: linear-gradient(90deg,#b45309,#f59e0b);
            color: #fff;
            border: 0;
            box-shadow: 0 8px 20px rgba(180,80,20,0.22);
            height: 48px;
        }
        .btn-ghost {
            background-color: #fff;
            color: #374151;
            border: 1px solid #e5e7eb;
            box-shadow: 0 1px 2px 0 rgba(0,0,0,0.04);
        }
        .btn-ghost:hover {
            background-color: #f8fafc !important;
            color: #1f2937 !important;
            transform: translateY(-2px);
        }

        .btn-primary, .btn-aux {
            margin-top: 5px;
            margin-bottom: -25px;
        }

        .finalize-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
            height: 48px;
            padding: 0.5rem 1rem !important;
            font-size: 1rem;
            font-weight: 600;
            min-width: 120px;
            border-radius: 0.75rem;
            background: linear-gradient(90deg,#f59e0b,#f97316);
            color: #fff;
            border: 0;
            box-shadow: 0 8px 20px rgba(245,158,11,0.18);
            cursor: pointer;
            line-height: 1;
            transition: all 0.12s ease-in-out;
        }

        .finalize-btn svg.finalize-btn-icon,
        .finalize-btn .finalize-btn-icon {
            width: 2rem !important;
            height: 2rem !important;
            flex-shrink: 0;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            stroke-width: 2 !important;
        }

        .finalize-btn:focus { outline: none; box-shadow: 0 0 0 4px rgba(245,158,11,0.12); }
        .finalize-btn:hover { transform: translateY(-2px); }

        /* === Ícones: padrão e overrides para botões de modelo === */

        /* Mantém o tamanho padrão dos ícones menores (outros botões) */
        .base-btn svg,
        .base-btn img,
        .option-group svg {
            width: 1.25rem;     /* 20px - padrão existente */
            height: 1.25rem;
            flex-shrink: 0;
            display: inline-flex;
            align-items: center;
            justify-content: center;
        }

        /* Aumenta especificamente os ícones dos botões "Assinar Modelo" e "Finalizar e Assinar Modelo" */
        .finalize-btn svg,
        .finalize-btn .finalize-btn-icon,
        .base-btn .icon-doc {
            width: 1.75rem !important;   /* ~28px - ícone maior */
            height: 1.75rem !important;
            flex-shrink: 0;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            stroke-width: 2 !important;
        }

        .finalize-btn svg.w-5,
        .base-btn .icon-doc.w-5,
        .base-btn svg.w-5 {
            width: 1.5rem !important;
            height: 1.5rem !important;
        }

        /* Ajuste visual fino do espaçamento entre ícone e texto (se necessário) */
        .finalize-btn span,
        .base-btn span {
            line-height: 1;
            vertical-align: middle;
        }

        .base-btn img, .finalize-btn img {
            max-height: 20px;
            width: auto;
            flex-shrink: 0;
        }

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
            line-height: 1.25; 
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

        .icon-sim { color: #16a34a; }
        .icon-nao { color: #dc2626; }
        .icon-continuar { color: #2563EB; }
        .icon-doc { color: #ffffff; }
        .icon-voltar { color: #dc2626; }

        .base-btn.btn-voltar {
            border-radius: 0.75rem !important;
            background-color: #fff !important;
            color: #374151 !important;
            border: 1px solid #e6e6e6 !important;
            box-shadow: 0 1px 2px rgba(0,0,0,0.04);
            transition: all 0.12s ease-in-out;
            min-width: 120px;
        }
        .base-btn.btn-voltar:hover {
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
        .summary .summary-title { display: flex; align-items: center; gap: 0.5rem; } /* Adicionado para alinhar título e contador */
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
        .pill-outro { background: #eef2ff; color: #3730a3; }

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

        /***** START: CSS PARA O PAINEL DE HOVER (ADICIONADO) *****/
        .info-wrapper {
            position: relative;
        }
        .info-hover-panel {
            position: absolute;
            bottom: 100%;
            left: 0;
            width: 100%;
            margin-bottom: 12px;
            background-color: #fff;
            border-radius: 1rem;
            padding: 0.85rem;
            box-shadow: 0 20px 45px -10px rgba(2,6,23,0.2);
            border: 1px solid rgba(15,23,42,0.08);
            opacity: 0;
            visibility: hidden;
            pointer-events: none;
            transition: all 0.2s ease-out;
            z-index: 70;
            transform: translateY(10px);
            display: flex;
            flex-direction: column;
            gap: 0.6rem;
        }
        .info-hover-panel::after {
            content: '';
            position: absolute;
            bottom: -6px;
            left: 50%;
            transform: translateX(-50%) rotate(45deg);
            width: 12px;
            height: 12px;
            background-color: #fff;
            border-right: 1px solid rgba(15,23,42,0.08);
            border-bottom: 1px solid rgba(15,23,42,0.08);
        }
        .info-wrapper:hover .info-hover-panel {
            opacity: 1;
            visibility: visible;
            pointer-events: auto;
            transform: translateY(0);
        }
        
    </style>

    @if ($isComplete)
        <div class="completion-card" x-transition.opacity.scale.duration.400ms>
            <div class="pt-6 flex flex-col items-center justify-center">
                <svg class="w-16 h-16 text-green-500 mb-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"/>
                </svg>
                <h2>Processo Concluído!</h2>
                <p>O fluxo foi finalizado e o modelo do documento foi gerado com sucesso.</p>
                <div class="mt-6 flex flex-col sm:flex-row gap-4 pb-6 justify-center">
                    <a href="{{ route('filament.admin.resources.processos.peticao-inicial.minutar-despacho.create', ['statusprocesso_id' => $statusProcessoAtual ?? 2]) }}"
                        class="base-btn btn-primary">
                        Iniciar Novo Fluxo
                    </a>
                    <a href="{{ url('/admin') }}" class="base-btn btn-secondary btn-aux">Voltar para o Dashboard</a>
                </div>
            </div>
        </div>

    @elseif ($isFinalStep)
        <div class="max-w-3xl ml-6 md:ml-12 p-8 bg-gray-100 rounded-3xl shadow-2xl border border-amber-50"
            x-transition.opacity.duration.300ms>
        </div>

    @else
        @if ($currentId && isset($fluxos[$currentId]))
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
                                {{-- A variável $isModeloPessoaStep está definida no bloco PHP no topo deste arquivo --}}

                                @if (isset($currentStep['sim']) || isset($currentStep['nao']))
                                    {{-- Container principal dos botões de ação --}}
                                    <div class="flex flex-wrap gap-3 w-full items-center justify-start"> 
                                        
                                        {{-- Estrutura de botões de Opção --}}
                                        @if ($isModeloPessoaStep)
                                            {{-- Cenário 1: Assinar Modelo, Continuar, e Voltar --}}
                                            
                                            {{-- Botão Assinar Modelo (com ícone document-text) --}}
                                            <button type="button"
                                                    wire:click="openModeloOnly({{ $currentId }})"
                                                    class="finalize-btn btn-same-size"> 
                                                <svg xmlns="http://www.w3.org/2000/svg" class="finalize-btn-icon icon-doc" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.8">
                                                    <path stroke-linecap="round" stroke-linejoin="round" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
                                                </svg>
                                                <span>Assinar Modelo</span>
                                            </button>

                                            {{-- Botão Continuar (Tamanho fixo, ícone azul, estilo base-btn btn-ghost) --}}
                                            @if (isset($currentStep['nao']))
                                                <button type="button"
                                                        wire:click="selectOption('nao')"
                                                        @click="selectedOption = 'nao'"
                                                        wire:loading.attr="disabled"
                                                        class="base-btn btn-ghost btn-same-size" 
                                                        :class="selectedOption === 'nao' ? 'option-group-btn-active' : ''">
                                                    <svg class="icon-continuar w-4 h-4" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3"> {{-- STROKE-WIDTH PADRONIZADO PARA 2.5 --}}
                                                        <path stroke-linecap="round" stroke-linejoin="round" d="M5 12h14"/>
                                                        <path stroke-linecap="round" stroke-linejoin="round" d="M13 5l7 7-7 7"/>
                                                    </svg>
                                                    <span>Continuar</span>
                                                </button>
                                            @endif

                                            {{-- Botão Voltar (Tamanho fixo, ao lado do Continuar) --}}
                                            @if(count($history) > 0)
                                                <button type="button" wire:click="goBack" class="base-btn btn-ghost btn-same-size btn-voltar" aria-label="Voltar">
                                                    <svg class="icon-voltar w-5 h-5" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"> {{-- STROKE-WIDTH PADRONIZADO PARA 2.5 --}}
                                                        <path stroke-linecap="round" stroke-linejoin="round" d="M11 17l-5-5m0 0l5-5m-5 5h12" />
                                                    </svg>
                                                    <span>Voltar</span>
                                                </button>
                                            @endif

                                            {{-- Botão Sim (Isolado e com estilo normal) --}}
                                            @if (isset($currentStep['sim']))
                                                <button type="button"
                                                        wire:click="selectOption('sim')"
                                                        @click="selectedOption = 'sim'"
                                                        wire:loading.attr="disabled"
                                                        class="base-btn btn-ghost btn-same-size"
                                                        :class="selectedOption === 'sim' ? 'option-group-btn-active' : 'option-group-btn-inactive'">
                                                     <svg class="icon-sim" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3">
                                                         <path stroke-linecap="round" stroke-linejoin="round" d="M5 13l4 4L19 7" />
                                                     </svg>
                                                     <span>Sim</span>
                                                 </button>
                                            @endif


                                        @else
                                            {{-- Cenário 2: Sim/Não Padrão (grupo de botões) e Voltar --}}
                                            <div role="group" class="option-group">
                                                @if (isset($currentStep['sim']))
                                                    <button type="button"
                                                            wire:click="selectOption('sim')"
                                                            @click="selectedOption = 'sim'"
                                                            wire:loading.attr="disabled"
                                                            :class="selectedOption === 'sim' ? 'option-group-btn option-group-btn-active' : 'option-group-btn option-group-btn-inactive'">
                                                         <svg class="icon-sim" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3">
                                                             <path stroke-linecap="round" stroke-linejoin="round" d="M5 13l4 4L19 7" />
                                                         </svg>
                                                         <span>Sim</span>
                                                     </button>
                                                 @endif
                                                 @if (isset($currentStep['nao']))
                                                     <button type="button"
                                                             wire:click="selectOption('nao')"
                                                             @click="selectedOption = 'nao'"
                                                             wire:loading.attr="disabled"
                                                             class="option-group-btn"
                                                             :class="selectedOption === 'nao' ? 'option-group-btn-active' : 'option-group-btn option-group-btn-inactive'">
                                                         <svg class="icon-nao" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3">
                                                             <line x1="18" y1="6" x2="6" y2="18" />
                                                             <line x1="6" y1="6" x2="18" y2="18" />
                                                         </svg>
                                                         <span>Não</span>
                                                     </button>
                                                 @endif
                                            </div>

                                            {{-- Botão Voltar para o cenário Sim/Não padrão --}}
                                            @if(count($history) > 0)
                                                <button type="button" wire:click="goBack" class="base-btn btn-ghost btn-same-size btn-voltar" aria-label="Voltar">
                                                    <svg class="icon-voltar w-5 h-5" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5">
                                                        <path stroke-linecap="round" stroke-linejoin="round" d="M11 17l-5-5m0 0l5-5m-5 5h12" />
                                                    </svg>
                                                    <span>Voltar</span>
                                                </button>
                                            @endif
                                        @endif
                                        
                                    </div> {{-- Fim do flex container para os botões --}}
                                @endif

                                 @if (!isset($currentStep['sim']) && !isset($currentStep['nao']) && isset($currentStep['modelo']))
                                     {{-- CORREÇÃO FINAL APLICADA AQUI: Adiciona ícone e usa o padding padrão do base-btn --}}
                                     <button type="button" wire:click="finalizeAndOpenModelo({{ $currentId }})" class="base-btn btn-secondary btn-same-size">
                                        <svg class="icon-doc" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8">
                                            <path stroke-linecap="round" stroke-linejoin="round" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
                                        </svg>
                                        <span>Finalizar e Assinar Modelo</span>
                                    </button>
                                     {{-- Botão Voltar para passos finais --}}
                                     @if(count($history) > 0)
                                        <button type="button" wire:click="goBack" class="base-btn btn-ghost btn-same-size btn-voltar" aria-label="Voltar">
                                            <svg class="icon-voltar w-5 h-5" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5">
                                                <path stroke-linecap="round" stroke-linejoin="round" d="M11 17l-5-5m0 0l5-5m-5 5h12" />
                                            </svg>
                                            <span>Voltar</span>
                                        </button>
                                     @endif
                                 @elseif (!isset($currentStep['sim']) && !isset($currentStep['nao']) && !isset($currentStep['modelo']))
                                     {{-- CORREÇÃO FINAL APLICADA AQUI: Usa btn-same-size --}}
                                     <button type="button" wire:click="finalizeOnly()" class="base-btn btn-secondary btn-same-size">Finalizar e Concluir</button>
                                     {{-- Botão Voltar para passos finais --}}
                                     @if(count($history) > 0)
                                        <button type="button" wire:click="goBack" class="base-btn btn-ghost btn-same-size btn-voltar" aria-label="Voltar">
                                            <svg class="icon-voltar w-5 h-5" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5">
                                                <path stroke-linecap="round" stroke-linejoin="round" d="M11 17l-5-5m0 0l5-5m-5 5h12" />
                                            </svg>
                                            <span>Voltar</span>
                                        </button>
                                     @endif
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

     @unless ($isComplete)
     <div class="bottom-panel"
          aria-hidden="false"
          x-data="{
              competencia: @entangle('competencia'),
              currentTime: '--:--',
              sessionTime: '00:00:00',

              init() {
                  const startTime = new Date();

                  const updateCurrentTime = () => {
                      const now = new Date();
                      this.currentTime = `${String(now.getHours()).padStart(2, '0')}:${String(now.getMinutes()).padStart(2, '0')}`;
                  };

                  const updateElapsedTime = () => {
                      const now = new Date();
                      const totalSeconds = Math.floor((now - startTime) / 1000);
                      const hours = String(Math.floor(totalSeconds / 3600)).padStart(2, '0');
                      const minutes = String(Math.floor((totalSeconds % 3600) / 60)).padStart(2, '0');
                      const seconds = String(totalSeconds % 60).padStart(2, '0');
                      this.sessionTime = `${hours}:${minutes}:${seconds}`;
                  };

                  updateCurrentTime();
                  updateElapsedTime();

                  setInterval(updateCurrentTime, 30000);
                  setInterval(updateElapsedTime, 1000);
              }
          }"
          x-init="init()">
          <div class="inner">
              <div class="card summary" x-data="{ openSummary: true }">
                  <div class="summary-header">
                      <div class="summary-title">
                          <h3>Resumo das Respostas</h3>
                          <span class="summary-count">{{ count($history ?? []) }}</span>
                      </div>
                      <div class="summary-controls">
                          <button type="button" class="summary-toggle" x-bind:title="openSummary ? 'Recolher' : 'Expandir'" @click="openSummary = !openSummary">
                              <svg x-show="!openSummary" xmlns="http://www.w3.org/2000/svg" class="w-5 h-5" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" /></svg>
                              <svg x-show="openSummary" xmlns="http://www.w3.org/2000/svg" class="w-5 h-5" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 15l7-7 7 7" /></svg>
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
                                          $pillClass = 'pill-outro';
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

              <div class="info-wrapper card info" role="region" aria-label="Informações do processo">

                  <div class="info-hover-panel">
                      <div class="info-row">
                          <div class="info-field"><svg class="info-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="currentColor"><path d="M12 2v20"></path><path d="M17 7l-5 5-5-5"></path></svg><div><div class="label">Dias Estacionado</div><div class="value">...</div></div></div>
                          <div class="info-field"><svg class="info-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="currentColor"><rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect><line x1="16" y1="2" x2="16" y2="6"></line><line x1="8" y1="2" x2="8" y2="6"></line></svg><div><div class="label">Data Inicial</div><div class="value">...</div></div></div>
                          <div class="info-field"><svg class="info-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="currentColor"><path d="M22 11.08V12a10 10 0 11-5.93-9.14"></path><polyline points="22 4 12 14.01 9 11.01"></polyline></svg><div><div class="label">Data de Conclusão</div><div class="value">...</div></div></div>
                      </div>
                      <div class="info-row">
                          <div class="info-field"><svg class="info-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="currentColor"><path d="M21 16V8a2 2 0 00-1-1.73l-7-4a2 2 0 00-2 0l-7 4A2 2 0 003 8v8a2 2 0 001 1.73l7 4a2 2 0 002 0l7-4A2 2 0 0021 16z"></path><polyline points="3.27 6.96 12 12.01 20.73 6.96"></polyline><line x1="12" y1="22.08" x2="12" y2="12"></line></svg><div><div class="label">Advogados</div><div class="value">...</div></div></div>
                          <div class="info-field"><svg class="info-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="currentColor"><path d="M20 21v-2a4 4 0 00-4-4H8a4 4 0 00-4 4v2"></path><circle cx="12" cy="7" r="4"></circle></svg><div><div class="label">Nome da Parte</div><div class="value">...</div></div></div>

                          <div class="info-field">
                              <svg class="info-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="currentColor"><circle cx="12" cy="12" r="10"></circle><polyline points="12 6 12 12 16 14"></polyline></svg>
                              <div>
                                  <div class="label">Tempo de Sessão</div>
                                  <div class="value" x-text="sessionTime">00:00:00</div>
                              </div>
                          </div>

                      </div>
                  </div>

                  <div class="info-row">
                      <div class="info-field" title="Data">
                          <svg class="info-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="currentColor"><rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect><line x1="16" y1="2" x2="16" y2="6"></line><line x1="8" y1="2" x2="8" y2="6"></line></svg>
                          <div>
                              <div class="label">Data</div>
                              <div class="value">{{ now()->format('d/m/Y') }}</div>
                          </div>
                      </div>
                      <div class="info-field" title="Hora">
                          <svg class="info-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="currentColor"><circle cx="12" cy="12" r="10"></circle><polyline points="12 6 12 12 16 14"></polyline></svg>
                          <div>
                              <div class="label">Hora</div>
                              <div class="value" x-text="currentTime">{{ now()->format('H:i') }}</div>
                          </div>
                      </div>
                      <div class="info-field" title="Tarefa">
                          <svg class="info-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="currentColor"><path d="M3 7h18"></path><path d="M3 12h18"></path><path d="M3 17h18"></path></svg>
                          <div>
                              <div class="label">Tarefa: Petição Inicial</div>
                              <div class="value">{{ $this->getHeading() }}</div>
                          </div>
                      </div>
                  </div>

                  <div style="height:8px;"></div>

                  <div class="info-row">
                      <div class="info-field" title="Nº do Processo">
                          <svg class="info-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="currentColor"><path d="M12 1v22"></path><circle cx="12" cy="8" r="4"></circle></svg>
                          <div>
                              <div class="label">Nº do Processo</div>
                              <div class="value">00000000000000000000</div>
                          </div>
                      </div>
                      <div class="info-field" title="Competência">
                            <svg class="info-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="currentColor"><path d="M10 21v-6"></path><path d="M14 21v-6"></path><path d="M3 7h18"></path></svg>
                            <div>
                                <div class="label">Competência</div>

                                <div class="value"
                                    x-text="(competencia === 'civel') ? 'Cível' : (competencia === 'criminal' ? 'Criminal' : '')">
                                    {{ isset($competencia) && $competencia ? (strtolower($competencia) === 'civel' ? 'Cível' : ucfirst($competencia)) : '' }}
                                </div>
                            </div>
                      </div>
                      <div class="info-field" title="Usuário">
                          <svg class="info-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="currentColor"><path d="M20 21v-2a4 4 0 00-4-4H8a4 4 0 00-4 4v2"></path><circle cx="12" cy="7" r="4"></circle></svg>
                          <div>
                              <div class="label">Usuário</div>
                              <div class="value">{{ auth()->user()->name ?? 'Usuário' }}</div>
                          </div>
                      </div>
                  </div>
              </div>

              <div class="card competence">
                    <div class="label">
                        <svg class="info-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor"><path d="M3 7h18"></path><path d="M3 12h18"></path><path d="M3 17h18"></path></svg>
                        Selecionar Competência
                    </div>

                    <select x-model="competencia" wire:model="competencia" aria-label="Selecionar competência">
                        <option value="">Clique para selecionar</option>
                        <option value="civel">Cível</option>
                        <option value="criminal">Criminal</option>
                    </select>

                    <div style="height:6px;"></div>
                    <div class="text-xs text-gray-500">Altere a competência quando necessário — a seleção será aplicada ao processo.</div>
              </div>
          </div>
      </div>
      @endunless

    <script>
        document.addEventListener('livewire:load', function () {
            if (typeof Livewire === 'undefined') return;

            Livewire.on('openModelo', function (url) {
                if (!url) {
                    alert('URL do modelo não encontrada.');
                    return;
                }
                window.open(url, '_blank');
            });
            
            Livewire.on('reset-selection', () => {
                Alpine.store('selectedOption', null);
            });
        });
    </script>

</div></x-filament-panels::page>