@php
    use Filament\Support\Enums\MaxWidth;

    $navigation = filament()->getNavigation();
    $livewire ??= null;
@endphp

<x-filament-panels::layout.base :livewire="$livewire">

<style>
    /* ✨ Background image for the entire page */
    body {
        background: url("{{ asset('images/backgroundTJES.png') }}") no-repeat center center fixed;
        background-size: cover;
        background-attachment: fixed;
        background-color: #f5f5f5; /* fallback color */
    }

    /* 1. Sidebar Header (DARK gray) */
    .fi-sidebar-header {
        height: 7rem !important;
    }
    .fi-sidebar-header *,
    .fi-sidebar-header svg * {
        color: inherit !important;
        stroke: currentColor !important;
    }

    /* 2. Sidebar Body (light gray with some transparency for contrast) */
    .fi-sidebar {
        background-color: rgba(230, 230, 230, 0.85) !important;
        backdrop-filter: blur(4px);
    }
    .fi-sidebar-nav {
        color: #111827 !important;
    }
    .fi-sidebar-nav a:hover,
    .fi-sidebar-nav button:hover {
        background-color: rgba(229, 231, 235, 0.85) !important;
    }

    /* 3. Topbar height */
    .fi-topbar nav {
        height: 7rem !important;
        background-color: rgba(255, 255, 255, 0.85) !important;
        backdrop-filter: blur(6px);
    }

    /* 4. Dashboard Widgets (semi-transparent white to stand out) */
    .fi-section,
    .fi-stats-overview-widget-card {
        background-color: rgba(243, 244, 246, 0.9) !important;
        backdrop-filter: blur(4px);
    }
</style>


    <div
        class="fi-layout flex min-h-screen w-full flex-row-reverse overflow-x-clip"
    >
        <div
            @if (filament()->isSidebarCollapsibleOnDesktop())
                x-data="{}"
                x-bind:class="{
                    'fi-main-ctn-sidebar-open': $store.sidebar.isOpen,
                }"
                x-bind:style="'display: flex; opacity:1;'"
            @elseif (filament()->isSidebarFullyCollapsibleOnDesktop())
                x-data="{}"
                x-bind:class="{
                    'fi-main-ctn-sidebar-open': $store.sidebar.isOpen,
                }"
                x-bind:style="'display: flex; opacity:1;'"
            @elseif (! (filament()->isSidebarCollapsibleOnDesktop() || filament()->isSidebarFullyCollapsibleOnDesktop() || filament()->hasTopNavigation() || (! filament()->hasNavigation())))
                x-data="{}"
                x-bind:style="'display: flex; opacity:1;'"
            @endif
            @class([
                'fi-main-ctn w-screen flex-1 flex-col',
                'h-full opacity-0 transition-all' => filament()->isSidebarCollapsibleOnDesktop() || filament()->isSidebarFullyCollapsibleOnDesktop(),
                'opacity-0' => ! (filament()->isSidebarCollapsibleOnDesktop() || filament()->isSidebarFullyCollapsibleOnDesktop() || filament()->hasTopNavigation() || (! filament()->hasNavigation())),
                'flex' => filament()->hasTopNavigation() || (! filament()->hasNavigation()),
            ])
        >
            @if (filament()->hasTopbar())
                {{ \Filament\Support\Facades\FilamentView::renderHook(\Filament\View\PanelsRenderHook::TOPBAR_BEFORE, scopes: $livewire?->getRenderHookScopes()) }}

                <x-filament-panels::topbar :navigation="$navigation" />

                {{ \Filament\Support\Facades\FilamentView::renderHook(\Filament\View\PanelsRenderHook::TOPBAR_AFTER, scopes: $livewire?->getRenderHookScopes()) }}
            @endif

            {{ \Filament\Support\Facades\FilamentView::renderHook(\Filament\View\PanelsRenderHook::CONTENT_BEFORE, scopes: $livewire?->getRenderHookScopes()) }}

            <main
                @class([
                    'fi-main mx-auto h-full w-full px-4 md:px-6 lg:px-8',
                    match ($maxContentWidth ??= (filament()->getMaxContentWidth() ?? MaxWidth::SevenExtraLarge)) {
                        MaxWidth::ExtraSmall, 'xs' => 'max-w-xs',
                        MaxWidth::Small, 'sm' => 'max-w-sm',
                        MaxWidth::Medium, 'md' => 'max-w-md',
                        MaxWidth::Large, 'lg' => 'max-w-lg',
                        MaxWidth::ExtraLarge, 'xl' => 'max-w-xl',
                        MaxWidth::TwoExtraLarge, '2xl' => 'max-w-2xl',
                        MaxWidth::ThreeExtraLarge, '3xl' => 'max-w-3xl',
                        MaxWidth::FourExtraLarge, '4xl' => 'max-w-4xl',
                        MaxWidth::FiveExtraLarge, '5xl' => 'max-w-5xl',
                        MaxWidth::SixExtraLarge, '6xl' => 'max-w-6xl',
                        MaxWidth::SevenExtraLarge, '7xl' => 'max-w-7xl',
                        MaxWidth::Full, 'full' => 'max-w-full',
                        default => $maxContentWidth,
                    },
                ])
            >
                {{ \Filament\Support\Facades\FilamentView::renderHook(\Filament\View\PanelsRenderHook::CONTENT_START, scopes: $livewire?->getRenderHookScopes()) }}

                {{ $slot }}

                {{ \Filament\Support\Facades\FilamentView::renderHook(\Filament\View\PanelsRenderHook::CONTENT_END, scopes: $livewire?->getRenderHookScopes()) }}
            </main>

            {{ \Filament\Support\Facades\FilamentView::renderHook(\Filament\View\PanelsRenderHook::CONTENT_AFTER, scopes: $livewire?->getRenderHookScopes()) }}

            {{ \Filament\Support\Facades\FilamentView::renderHook(\Filament\View\PanelsRenderHook::FOOTER, scopes: $livewire?->getRenderHookScopes()) }}
        </div>

        @if (filament()->hasNavigation())
            <div
                x-cloak
                x-data="{}"
                x-on:click="$store.sidebar.close()"
                x-show="$store.sidebar.isOpen"
                x-transition.opacity.300ms
                class="fi-sidebar-close-overlay fixed inset-0 z-30 bg-gray-950/50 transition duration-500 dark:bg-gray-950/75 lg:hidden"
            ></div>

            <x-filament-panels::sidebar :navigation="$navigation" />

            <script>
                document.addEventListener('DOMContentLoaded', () => {
                    setTimeout(() => {
                        let activeSidebarItem = document.querySelector(
                            '.fi-main-sidebar .fi-sidebar-item.fi-active',
                        )

                        if (
                            !activeSidebarItem ||
                            activeSidebarItem.offsetParent === null
                        ) {
                            activeSidebarItem = document.querySelector(
                                '.fi-main-sidebar .fi-sidebar-group.fi-active',
                            )
                        }

                        if (
                            !activeSidebarItem ||
                            activeSidebarItem.offsetParent === null
                        ) {
                            return
                        }

                        const sidebarWrapper = document.querySelector(
                            '.fi-main-sidebar .fi-sidebar-nav',
                        )

                        if (!sidebarWrapper) {
                            return
                        }

                        sidebarWrapper.scrollTo(
                            0,
                            activeSidebarItem.offsetTop -
                                window.innerHeight / 2,
                        )
                    }, 10)
                })
            </script>
        @endif
    </div>
</x-filament-panels::layout.base>