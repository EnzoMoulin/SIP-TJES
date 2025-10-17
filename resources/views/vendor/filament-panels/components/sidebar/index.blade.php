@props([
    'navigation',
])

@php
    $openSidebarClasses = 'fi-sidebar-open w-[--sidebar-width] translate-x-0 shadow-xl ring-1 ring-gray-950/5 dark:ring-white/10 rtl:-translate-x-0';
    $isRtl = __('filament-panels::layout.direction') === 'rtl';
@endphp

{{-- Small CSS override to force sidebar text to white, icons as light pink, selected item pink, hover gray translucent. --}}
<style>
    :root {
        --sidebar-text-color: #ffffff; /* Changed from --sidebar-icon-white */
        --sidebar-icon-color: #f6adcd; /* NEW: Added light pink for icons */
        --sidebar-selected-bg: #ff4da6;
        --sidebar-selected-bg-translucent: rgba(246, 173, 205, 0.6);
        --sidebar-hover-bg: rgba(255,255,255,0.06);
        --sidebar-bg: rgba(0,0,0,0.6);
    }

    /* Base da sidebar */
    .fi-sidebar {
        background-color: var(--sidebar-bg) !important;
        color: var(--sidebar-text-color) !important; /* MODIFIED */
        -webkit-font-smoothing: antialiased;
    }

    /* Forçar texto branco nos elementos textuais (mantém inputs, labels etc) */
    .fi-sidebar,
    .fi-sidebar p,
    .fi-sidebar span,
    .fi-sidebar li,
    .fi-sidebar a,
    .fi-sidebar button,
    .fi-sidebar input,
    .fi-sidebar select,
    .fi-sidebar textarea {
        color: var(--sidebar-text-color) !important; /* MODIFIED */
    }

    /* Ícones: somente contorno rosa claro (stroke) e sem preenchimento */
    .fi-sidebar svg,
    .fi-sidebar .fi-icon,
    .fi-sidebar [data-icon] {
        stroke: var(--sidebar-icon-color) !important; /* MODIFIED */
        fill: transparent !important;
        color: var(--sidebar-icon-color) !important; /* MODIFIED */
        stroke-width: 1.6 !important;
        vector-effect: non-scaling-stroke !important;
        transition: filter .12s ease, transform .12s ease, opacity .12s ease;
    }

    /* Casos comuns de outline icons (garantir stroke rosa claro) */
    .fi-sidebar svg[fill="none"] path,
    .fi-sidebar svg[fill="none"] line,
    .fi-sidebar svg[fill="none"] circle,
    .fi-sidebar svg[fill="none"] rect,
    .fi-sidebar svg path:not([fill]) {
        stroke: var(--sidebar-icon-color) !important; /* MODIFIED */
        fill: transparent !important;
    }

    /* Hover: cinza translúcido (MANTIDO) */
    .fi-sidebar .fi-sidebar-nav a,
    .fi-sidebar .fi-sidebar-group > button,
    .fi-sidebar .fi-sidebar-group-items a {
        transition: background-color .12s ease, color .12s ease, filter .12s ease;
    }

    .fi-sidebar .fi-sidebar-nav a:hover,
    .fi-sidebar .fi-sidebar-group > button:hover,
    .fi-sidebar .fi-sidebar-group-items a:hover {
        background-color: var(--sidebar-hover-bg) !important;
        filter: brightness(1.08) !important;
    }

    .fi-sidebar svg:hover {
        filter: brightness(1.08) !important;
    }

    /* ---------- OVERRIDE: classes utilitárias que o Filament/Tailwind injeta ---------- */

    .fi-sidebar .bg-white {
        background-color: transparent !important;
    }

    /* Se o item ativo recebe `.bg-white`, substituir para rosa translúcido */
    .fi-sidebar a.bg-white,
    .fi-sidebar .bg-white a,
    .fi-sidebar .fi-sidebar-nav a.bg-white,
    aside.fi-sidebar .bg-white {
        background-color: var(--sidebar-selected-bg-translucent) !important;
        color: var(--sidebar-text-color) !important; /* MODIFIED */
    }

    /* Reforçar estado ativo por atributos/com classes (específico) */
    aside.fi-sidebar a[aria-current="true"],
    aside.fi-sidebar a.active,
    aside.fi-sidebar .is-active,
    aside.fi-sidebar .fi-sidebar-nav a[aria-pressed="true"],
    aside.fi-sidebar .fi-sidebar-group .fi-sidebar-group-items a.active,
    aside.fi-sidebar .fi-sidebar-group > button[aria-expanded="true"] {
        background-color: var(--sidebar-selected-bg-translucent) !important;
        color: var(--sidebar-text-color) !important; /* MODIFIED */
    }

    /* Caso exista regra inline com background mais específica */
    aside.fi-sidebar .fi-sidebar-nav a[style*="background-color"],
    aside.fi-sidebar .fi-sidebar-nav a[style*="background"] {
        background-color: var(--sidebar-selected-bg-translucent) !important;
        color: var(--sidebar-text-color) !important; /* MODIFIED */
    }

    /* Ícones dentro do item ativo — manter contorno rosa claro */
    aside.fi-sidebar a[aria-current="true"] svg,
    aside.fi-sidebar a.active svg,
    aside.fi-sidebar .is-active svg,
    aside.fi-sidebar .bg-white svg {
        stroke: var(--sidebar-icon-color) !important; /* MODIFIED */
        fill: transparent !important;
    }

    /* Neutraliza bordas/brancos indesejados em elementos selecionados (pills/etc) */
    .fi-sidebar .selected-pill,
    .fi-sidebar .fi-sidebar-selected-ctn,
    .fi-sidebar .fi-sidebar-nav .selected {
        background-color: var(--sidebar-selected-bg-translucent) !important;
        color: var(--sidebar-text-color) !important; /* MODIFIED */
        border-color: transparent !important;
    }

    /* Legibilidade: títulos de seção */
    .fi-sidebar .fi-sidebar-heading,
    .fi-sidebar .fi-sidebar-section-title {
        color: var(--sidebar-text-color) !important; /* MODIFIED */
        text-shadow: 0 1px 0 rgba(0,0,0,0.35);
    }
</style>

{{-- format-ignore-start --}}
<aside
    x-data="{}"
    @if (filament()->isSidebarCollapsibleOnDesktop() && (! filament()->hasTopNavigation()))
        x-cloak
        x-bind:class="
            $store.sidebar.isOpen
                ? @js($openSidebarClasses . ' ' . 'lg:sticky')
                : '-translate-x-full rtl:translate-x-full lg:sticky lg:translate-x-0 rtl:lg:-translate-x-0'
        "
    @else
        @if (filament()->hasTopNavigation())
            x-cloak
            x-bind:class="$store.sidebar.isOpen ? @js($openSidebarClasses) : '-translate-x-full rtl:translate-x-full'"
        @elseif (filament()->isSidebarFullyCollapsibleOnDesktop())
            x-cloak
            x-bind:class="$store.sidebar.isOpen ? @js($openSidebarClasses . ' ' . 'lg:sticky') : '-translate-x-full rtl:translate-x-full'"
        @else
            x-cloak="-lg"
            x-bind:class="
                $store.sidebar.isOpen
                    ? @js($openSidebarClasses . ' ' . 'lg:sticky')
                    : 'w-[--sidebar-width] -translate-x-full rtl:translate-x-full lg:sticky'
            "
        @endif
    @endif
    style="
        background-image: url('{{ asset('images/Convento-da-penha-Saturacao-50%-brilho-menos50%-01x.png') }}');
        background-size: cover;
        background-position: center;
    "
    {{
        $attributes->class([
            'fi-sidebar fixed inset-y-0 start-0 z-30 flex flex-col h-screen content-start transition-all lg:z-0 lg:bg-transparent lg:shadow-none lg:ring-0 lg:transition-none dark:lg:bg-transparent',
            'text-white dark:text-white', // This class is now overridden by our <style> block
            'lg:translate-x-0 rtl:lg:-translate-x-0' => ! (filament()->isSidebarCollapsibleOnDesktop() || filament()->isSidebarFullyCollapsibleOnDesktop() || filament()->hasTopNavigation()),
            'lg:-translate-x-full rtl:lg:translate-x-full' => filament()->hasTopNavigation(),
        ])
    }}
>
    <div class="absolute inset-0 bg-black/40 dark:bg-black/60 backdrop-blur-sm"></div>

    <div class="relative z-10 flex h-full flex-col">
        <div class="overflow-x-clip">
            <header
                class="fi-sidebar-header flex h-16 items-center bg-transparent px-6 ring-1 ring-gray-950/5 dark:bg-transparent dark:ring-white/10 lg:shadow-sm margin-top:300px text-white";
            >
                <div
                    @if (filament()->isSidebarCollapsibleOnDesktop())
                        x-show="$store.sidebar.isOpen"
                        x-transition:enter="lg:transition lg:delay-100"
                        x-transition:enter-start="opacity-0"
                        x-transition:enter-end="opacity-100"
                        margin-top:300px;
                    @endif
                >
                    @if ($homeUrl = filament()->getHomeUrl())
                        <a {{ \Filament\Support\generate_href_html($homeUrl) }}>
                            <x-filament-panels::logo />
                        </a>
                    @else
                        <x-filament-panels::logo />
                    @endif
                </div>

                @if (filament()->isSidebarCollapsibleOnDesktop())
                    <x-filament::icon-button
                        color="dark-gray"
                        :icon="$isRtl ? 'heroicon-o-chevron-left' : 'heroicon-o-chevron-right'"
                        :icon-alias="$isRtl ? ['panels::sidebar.expand-button.rtl', 'panels::sidebar.expand-button'] : 'panels::sidebar.expand-button'"
                        icon-size="lg"
                        :label="__('filament-panels::layout.actions.sidebar.expand.label')"
                        x-cloak
                        x-data="{}"
                        x-on:click="$store.sidebar.open()"
                        x-show="! $store.sidebar.isOpen"
                        class="mx-auto"
                    />
                @endif

                @if (filament()->isSidebarCollapsibleOnDesktop() || filament()->isSidebarFullyCollapsibleOnDesktop())
                    <x-filament::icon-button
                        color="dark-gray"
                        :icon="$isRtl ? 'heroicon-o-chevron-right' : 'heroicon-o-chevron-left'"
                        :icon-alias="$isRtl ? ['panels::sidebar.collapse-button.rtl', 'panels::sidebar.collapse-button'] : 'panels::sidebar.collapse-button'"
                        icon-size="lg"
                        :label="__('filament-panels::layout.actions.sidebar.collapse.label')"
                        x-cloak
                        x-data="{}"
                        x-on:click="$store.sidebar.close()"
                        x-show="$store.sidebar.isOpen"
                        class="ms-auto hidden lg:flex"
                    />
                @endif
            </header>
        </div>

        <nav
            class="fi-sidebar-nav flex-grow flex flex-col gap-y-7 overflow-y-auto overflow-x-hidden px-6 py-8 text-white"
            style="scrollbar-gutter: stable"
        >
            {{ \Filament\Support\Facades\FilamentView::renderHook(\Filament\View\PanelsRenderHook::SIDEBAR_NAV_START) }}

            @if (filament()->hasTenancy() && filament()->hasTenantMenu())
                <div
                    @class([
                        'fi-sidebar-nav-tenant-menu-ctn',
                        '-mx-2' => ! filament()->isSidebarCollapsibleOnDesktop(),
                    ])
                    @if (filament()->isSidebarCollapsibleOnDesktop())
                        x-bind:class="$store.sidebar.isOpen ? '-mx-2' : '-mx-4'"
                    @endif
                >
                    <x-filament-panels::tenant-menu />
                </div>
            @endif

            <ul class="fi-sidebar-nav-groups -mx-2 flex flex-col gap-y-7">
                @foreach ($navigation as $group)
                    <x-filament-panels::sidebar.group
                        :active="$group->isActive()"
                        :collapsible="$group->isCollapsible()"
                        :icon="$group->getIcon()"
                        :items="$group->getItems()"
                        :label="$group->getLabel()"
                        :attributes="\Filament\Support\prepare_inherited_attributes($group->getExtraSidebarAttributeBag())"
                    />
                @endforeach
            </ul>

            <script>
                var collapsedGroups = JSON.parse(
                    localStorage.getItem('collapsedGroups'),
                )

                if (collapsedGroups === null || collapsedGroups === 'null') {
                    localStorage.setItem(
                        'collapsedGroups',
                        JSON.stringify(@js(
                            collect($navigation)
                                ->filter(fn (\Filament\Navigation\NavigationGroup $group): bool => $group->isCollapsed())
                                ->map(fn (\Filament\Navigation\NavigationGroup $group): string => $group->getLabel())
                                ->values()
                                ->all()
                        )),
                    )
                }

                collapsedGroups = JSON.parse(
                    localStorage.getItem('collapsedGroups'),
                )

                document
                    .querySelectorAll('.fi-sidebar-group')
                    .forEach((group) => {
                        if (
                            !collapsedGroups.includes(group.dataset.groupLabel)
                        ) {
                            return
                        }

                        group.querySelector(
                            '.fi-sidebar-group-items',
                        ).style.display = 'none'
                        group
                            .querySelector('.fi-sidebar-group-collapse-button')
                            .classList.add('rotate-180')
                    })
            </script>

            {{ \Filament\Support\Facades\FilamentView::renderHook(\Filament\View\PanelsRenderHook::SIDEBAR_NAV_END) }}
        </nav>

        {{ \Filament\Support\Facades\FilamentView::renderHook(\Filament\View\PanelsRenderHook::SIDEBAR_FOOTER) }}
    </div>
</aside>
{{-- format-ignore-end --}}