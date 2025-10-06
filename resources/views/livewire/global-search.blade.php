<div class="w-full max-w-md mx-auto">
    <input
        type="text"
        wire:model.debounce.300ms="search"
        placeholder="Buscar..."
        class="w-full rounded-md border border-gray-300 shadow-sm focus:border-amber-500 focus:ring focus:ring-amber-200 focus:ring-opacity-50 p-2 transition-colors duration-200"
    />

    @if($results->isNotEmpty())
        <ul class="mt-2 border border-gray-200 rounded-md divide-y divide-gray-200 bg-white shadow-sm">
            @foreach($results as $result)
                <li class="p-2 hover:bg-amber-50 cursor-pointer transition-colors duration-150">
                    <a href="{{ $result->url }}" class="block text-gray-800 hover:text-amber-600">
                        {{ $result->title }}
                    </a>
                </li>
            @endforeach
        </ul>
    @elseif($search)
        <div class="mt-2 text-gray-500 italic">
            Nenhum resultado encontrado.
        </div>
    @endif
</div>