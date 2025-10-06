<div class="flex items-center w-full max-w-2xl lg:max-w-3xl">
    <button
        type="button"
        onclick="window.dispatchEvent(new CustomEvent('open-global-search'))"
        class="relative w-full text-left"
        aria-label="Abrir busca global"
    >
        <span class="block w-full h-10 pl-3 pr-12 text-sm text-gray-500 bg-gray-50 border border-gray-300 rounded-lg
                     dark:bg-gray-700 dark:text-gray-300 dark:border-gray-600">
            Pesquisar...
        </span>

        <span class="absolute inset-y-0 right-3 flex items-center pointer-events-none">
            <x-heroicon-s-magnifying-glass class="w-5 h-5 text-gray-400" />
        </span>
    </button>
</div>