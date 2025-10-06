<div
    x-data="{ isOpen: false }"
    x-on:click.away="isOpen = false"
    x-on:keydown.escape.window="isOpen = false"
    class="fi-global-search-input"
>
    <div style="position: relative;">

        <input
            wire:model.live.debounce.500ms="search"
            type="search"
            placeholder="Pesquisar processo..."
            x-on:focus="isOpen = true"
            autocomplete="off"
            style="
                width: 100%;
                height: 2.5rem;
                border-radius: 0.5rem;
                border: 1px solid #d1d5db;
                padding-left: 1rem;
                padding-right: 2.5rem;
                background-color: #ffffff;
                color: #111827 !important; /* <-- ADIÇÃO DEFINITIVA PARA FORÇAR A COR DO TEXTO */
            "
        />

        <div style="position: absolute; top: 50%; right: 0.75rem; transform: translateY(-50%); pointer-events: none;">
            <svg
                aria-hidden="true"
                xmlns="http://www.w3.org/2000/svg"
                fill="none"
                viewBox="0 0 24 24"
                stroke-width="1.5"
                stroke="currentColor"
                style="
                    display: block !important;
                    height: 1.25rem !important;
                    width: 1.25rem !important;
                    color: #9ca3af !important;
                "
            >
                <path stroke-linecap="round" stroke-linejoin="round" d="m21 21-5.197-5.197m0 0A7.5 7.5 0 1 0 5.196 5.196a7.5 7.5 0 0 0 10.607 10.607Z" />
            </svg>
        </div>
    </div>

    {{-- Dropdown de resultados (sem alterações) --}}
    @if (strlen($search) > 2)
        <div
            x-show="isOpen"
            x-cloak
            class="absolute top-full left-0 mt-2 w-full bg-white border border-gray-200 rounded-lg shadow-lg z-50 max-h-96 overflow-y-auto"
        >
            @if (!empty($results) && $results->isNotEmpty())
                <ul>
                    @foreach ($results as $result)
                        <li>
                            <a
                                href="{{ $result->getUrl() }}"
                                class="block px-4 py-3 text-sm hover:bg-gray-100 transition-colors duration-200"
                            >
                                {{ $result->getTitle() }}
                                <span class="block text-xs text-gray-500">{{ $result->getDetails()['Tipo'] ?? '' }}</span>
                            </a>
                        </li>
                    @endforeach
                </ul>
            @else
                <p class="px-4 py-3 text-sm text-gray-500">
                    {{ __('filament-panels::global-search.no_results_message') }}
                </p>
            @endif
        </div>
    @endif
</div>