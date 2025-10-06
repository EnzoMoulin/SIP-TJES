<x-filament-widgets::widget>
    <div class="grid gap-6 md:grid-cols-3">
        @foreach ($this->getStats() as $stat)
            {{ $stat }}
        @endforeach
    </div>
</x-filament-widgets::widget>