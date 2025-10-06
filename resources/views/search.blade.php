 <x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 dark:text-gray-200 leading-tight">
            Resultados da busca por "{{ $query }}"
        </h2>
    </x-slot>

    <div class="py-6">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white dark:bg-gray-800 shadow-sm sm:rounded-lg p-6">
                @if($results->isEmpty())
                    <p>Nenhum processo encontrado.</p>
                @else
                    <ul class="space-y-2">
                        @foreach($results as $process)
                            <li>
                                <a href="/processos/{{ $process->id }}" class="hover:underline">
                                    {{ $process->process_number }}
                                </a>
                            </li>
                        @endforeach
                    </ul>
                @endif
            </div>
        </div>
    </div>
</x-app-layout>