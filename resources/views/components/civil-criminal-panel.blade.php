<div class="civil-criminal-panel-container">
    
    {{-- This is the main card container with styling and Alpine.js state --}}
    <div x-data="{ selected: 'civil' }" class="w-72 bg-white rounded-lg shadow-2xl border border-gray-200">

        {{-- Card Header --}}
        <div class="px-4 py-3 border-b border-gray-200">
            <h3 class="text-base font-semibold text-gray-900">
                Selecionar Competência
            </h3>
        </div>

        {{-- Card Body with the two selectable buttons --}}
        <div class="p-4 flex items-center justify-center gap-x-2">
            
            <button
                type="button"
                @click="selected = 'civil'"
                :class="{ 'selected': selected === 'civil' }"
                class="btn-competencia"
            >
                Cível
            </button>
            
            <button
                type="button"
                @click="selected = 'criminal'"
                :class="{ 'selected': selected === 'criminal' }"
                class="btn-competencia"
            >
                Criminal
            </button>

        </div>
    </div>
</div>