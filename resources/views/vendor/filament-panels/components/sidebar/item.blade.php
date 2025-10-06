@props([
    'active' => false,
    'activeChildItems' => false,
    'activeIcon' => null,
    'badge' => null,
    'badgeColor' => null,
    'badgeTooltip' => null,
    'childItems' => [],
    'first' => false,
    'grouped' => false,
    'icon' => null,
    'last' => false,
    'shouldOpenUrlInNewTab' => false,
    'sidebarCollapsible' => true,
    'subGrouped' => false,
    'url',
])

@php
    $sidebarCollapsible = $sidebarCollapsible && filament()->isSidebarCollapsibleOnDesktop();

    $currentUrl = url()->current();
    $normalizedCurrent = rtrim($currentUrl, '/');
    $normalizedUrl = $url ? rtrim(url($url), '/') : null;

    $isActiveResolved = $active
        || ($normalizedUrl && $normalizedCurrent === $normalizedUrl);
@endphp

<li
    {{
        $attributes->class([
            'fi-sidebar-item',
            'fi-active fi-sidebar-item-active' => $isActiveResolved,
            'flex flex-col gap-y-1' => $isActiveResolved || $activeChildItems,
        ])
    }}
>
    <a
        {{ \Filament\Support\generate_href_html($url, $shouldOpenUrlInNewTab) }}
        x-on:click="window.matchMedia(`(max-width: 1024px)`).matches && $store.sidebar.close()"
        @if ($sidebarCollapsible)
            x-data="{ tooltip: false }"
            x-effect="
                tooltip = $store.sidebar.isOpen
                    ? false
                    : {
                          content: @js($slot->toHtml()),
                          placement: document.dir === 'rtl' ? 'left' : 'right',
                          theme: $store.theme,
                      }
            "
            x-tooltip.html="tooltip"
        @endif
        @class([
            'fi-sidebar-item-button relative flex items-center justify-center gap-x-3 rounded-lg px-2 py-2 outline-none transition duration-150 ease-in-out',
            'hover:bg-gray-100 focus-visible:bg-gray-100 dark:hover:bg-white/5 dark:focus-visible:bg-white/5' => filled($url),
            'bg-white dark:bg-white/5' => $isActiveResolved,
        ])
    >
        {{-- Left border accent for the active item --}}
        @if ($isActiveResolved)
            <div class="absolute left-0 top-0 h-full w-1 rounded-r-full bg-pink-400"></div>
        @endif

        @if (filled($icon))
            <x-filament::icon
                :icon="($isActiveResolved && $activeIcon) ? $activeIcon : $icon"
                class="fi-sidebar-item-icon h-6 w-6"
                style="stroke:#f472b6; fill:none;"
            />
        @endif

        @if ((blank($icon) && $grouped) || $subGrouped)
            <div
                class="fi-sidebar-item-grouped-border relative flex h-6 w-6 items-center justify-center"
            >
                @if (! $first)
                    <div class="absolute -top-1/2 bottom-1/2 w-px bg-gray-300 dark:bg-gray-600"></div>
                @endif

                @if (! $last)
                    <div class="absolute -bottom-1/2 top-1/2 w-px bg-gray-300 dark:bg-gray-600"></div>
                @endif

                <div
                    @class([
                        'relative h-1.5 w-1.5 rounded-full',
                        'bg-gray-400 dark:bg-gray-500' => ! $isActiveResolved,
                        'bg-pink-400 dark:bg-pink-400' => $isActiveResolved,
                    ])
                ></div>
            </div>
        @endif

        <span
            @if ($sidebarCollapsible)
                x-show="$store.sidebar.isOpen"
                x-transition:enter="lg:transition lg:delay-100"
                x-transition:enter-start="opacity-0"
                x-transition:enter-end="opacity-100"
            @endif
            @class([
                'fi-sidebar-item-label flex-1 truncate text-sm',
                'font-semibold' => $isActiveResolved,
                'font-medium' => ! $isActiveResolved,
            ])
            style="{{ $isActiveResolved ? 'color:#f472b6;' : '' }}"
        >
            {{ $slot }}
        </span>

        @if (filled($badge))
            <span>
                <x-filament::badge
                    :color="$badgeColor"
                    :tooltip="$badgeTooltip"
                >
                    {{ $badge }}
                </x-filament::badge>
            </span>
        @endif
    </a>

    @if (($isActiveResolved || $activeChildItems) && $childItems)
        <ul class="fi-sidebar-sub-group-items flex flex-col gap-y-1">
            @foreach ($childItems as $childItem)
                <x-filament-panels::sidebar.item
                    :active="$childItem->isActive()"
                    :active-child-items="$childItem->isChildItemsActive()"
                    :active-icon="$childItem->getActiveIcon()"
                    :badge="$childItem->getBadge()"
                    :badge-color="$childItem->getBadgeColor()"
                    :badge-tooltip="$childItem->getBadgeTooltip()"
                    :first="$loop->first"
                    grouped
                    :icon="$childItem->getIcon()"
                    :last="$loop->last"
                    :should-open-url-in-new-tab="$childItem->shouldOpenUrlInNewTab()"
                    sub-grouped
                    :url="$childItem->getUrl()"
                >
                    {{ $childItem->getLabel() }}
                </x-filament-panels::sidebar.item>
            @endforeach
        </ul>
    @endif
</li>