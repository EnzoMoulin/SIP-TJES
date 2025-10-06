@props([
    'navigation',
])

<div {!! $attributes->class(['fi-topbar sticky top-0 z-20']) !!}>
    <style>
        :root {
            --ui-dark-gray: #0C0A39;
            --ui-text-on-dark: #ffffff;
        }
        .fi-topbar, .fi-topbar nav, .fi-sidebar-header {
            background-color: var(--ui-dark-gray) !important;
            color: var(--ui-text-on-dark) !important;
        }
        .fi-topbar * { 
            color: inherit !important; 
        }

        .fi-topbar svg, .fi-topbar svg * { 
            stroke: currentColor !important; 
        }

        .fi-topbar .filament-logo { 
            display: none !important; 
        }

        .fi-global-search-wrapper {
            width: 500px !important; 
        }

        .center-topic, .process-number {
            font-size: 1.125rem;
            font-weight: 750;
            white-space: nowrap;
        }

        .center-block {
            display: flex;
            align-items: center;
        }
        .center-topic {
            margin-right: 2rem;
        }

        @media (min-width: 768px) {
            .center-topic { margin-right: 4rem; }
        }

        @media (min-width: 1280px) {
            .center-topic { margin-right: 6rem; }
        }

        .center-hidden { 
            display: none !important; 
        }
    </style>

    @php
        use Illuminate\Support\Str;

        $normalize = fn(?string $s) => $s ? trim(Str::ascii(mb_strtolower($s))) : '';

        $findActiveLabel = function ($items) use (&$findActiveLabel) {
            foreach ($items as $it) {
                if (method_exists($it, 'isActive') && $it->isActive() && method_exists($it, 'getLabel')) {
                    return $it->getLabel();
                }
                if (method_exists($it, 'getItems')) {
                    $res = $findActiveLabel($it->getItems());
                    if ($res) return $res;
                }
            }
            return null;
        };

        $activeLabel = null;
        foreach ($navigation as $group) {
            if (method_exists($group, 'isActive') && $group->isActive() && method_exists($group, 'getLabel')) {
                $activeLabel = $group->getLabel();
                break;
            }
            if (method_exists($group, 'getItems')) {
                $found = $findActiveLabel($group->getItems());
                if ($found) { $activeLabel = $found; break; }
            }
        }

        $normalizedActiveLabel = $activeLabel ? $normalize($activeLabel) : '';
        $routeName = request()->route()?->getName() ?? '';
        $normalizedRouteName = $normalize($routeName);
        $path = request()->path();
        $normalizedPath = $normalize($path);

        $mapLabelToTopic = function (?string $label) use ($normalize) {
            if (!$label) return null;
            $norm = $normalize($label);

            if (strpos($norm, 'minutar') !== false) {
                if (strpos($norm, 'decisao') !== false || strpos($norm, 'despacho') !== false) {
                    return 'Tarefa: Petição Inicial';
                }
                if (strpos($norm, 'sentenc') !== false) {
                    return 'Classe: Busca e Apreensão';
                }
            }

            if (strpos($norm, 'baaf') !== false) return 'Classe: Busca e Apreensão';
            if (strpos($norm, 'impugnacao') !== false && strpos($norm, 'penhora') !== false) return 'Etiqueta: Impugnação à Penhora';
            if (strpos($norm, 'atos') !== false && strpos($norm, 'dinamic') !== false) return 'Extra: Atos Dinâmicos';

            return trim($label) ?: null;
        };

        $topbarTopic = $mapLabelToTopic($activeLabel);
        $processNumber = $topbarTopic ? 'Processo Nº 00000000000000000000' : null;

        $hideCenter = false;

        $cadastroLabels = [
            $normalize('Cadastro de Modelos'),
            $normalize('Cadastro de Modelo'),
            $normalize('Cadastro de Processos'),
            $normalize('Cadastro de Processo'),
            $normalize('Cadastro'),
        ];

        if (in_array($normalizedActiveLabel, $cadastroLabels, true)) {
            $hideCenter = true;
        }

        if (!$hideCenter && preg_match('/^filament\.admin\.resources\.(cadastro-modelos|cadastro-processos)\.index$/', $normalizedRouteName)) {
            $hideCenter = true;
        }

        if (!$hideCenter && preg_match('#^admin/(cadastro-modelos|cadastro-processos)(/index)?$#', $normalizedPath)) {
            $hideCenter = true;
        }
    @endphp

    <nav class="flex h-16 items-center justify-between gap-x-4 px-4 shadow-sm">
        <div id="left-block" class="flex items-center gap-x-6">
             @if (filament()->hasNavigation())
                 <x-filament::icon-button color="gray" icon="heroicon-o-bars-3" icon-size="lg"
                    x-cloak x-data="{}" x-on:click="$store.sidebar.open()" x-show="! $store.sidebar.isOpen"
                    @class(['lg:hidden' => (! filament()->isSidebarFullyCollapsibleOnDesktop()) || filament()->isSidebarCollapsibleOnDesktop()]) />
                 <x-filament::icon-button color="gray" icon="heroicon-o-x-mark" icon-size="lg"
                    x-cloak x-data="{}" x-on:click="$store.sidebar.close()" x-show="$store.sidebar.isOpen"
                    class="lg:hidden" />
             @endif
        </div>

        <div id="center-block" class="center-block {{ $hideCenter ? 'center-hidden' : '' }}">
            <span class="center-topic" id="fi-topbar-topic">{{ $topbarTopic }}</span>
            <span class="process-number" id="fi-topbar-process">{{ $processNumber }}</span>
        </div>

        <div id="right-block" class="flex flex-shrink-0 items-center gap-x-6">
            @if (filament()->isGlobalSearchEnabled())
                <div class="fi-global-search-wrapper">
                     @livewire(App\Livewire\CustomGlobalSearch::class)
                </div>
            @endif
            @if (filament()->auth()->check())
                <x-filament-panels::user-menu />
            @endif
        </div>
    </nav>

    <script>
        (function(){
            // preserve seu script original aqui, se houver
        })();
    </script>
</div>