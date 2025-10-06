<?php

namespace App\Livewire;

use Filament\Facades\Filament;
use Filament\GlobalSearch\Contracts\GlobalSearchProvider;
use Filament\GlobalSearch\GlobalSearchResults;
use Illuminate\Contracts\View\View;
use Livewire\Component;

class CustomGlobalSearch extends Component implements GlobalSearchProvider
{
    public ?string $search = '';

    protected $listeners = ['refresh' => '$refresh'];

    public function getResults(?string $query): ?GlobalSearchResults
    {
        $query = trim($query);

        if (blank($query)) {
            return null;
        }

        $results = Filament::getGlobalSearchResults($query);

        if ($results->isEmpty()) {
            return null;
        }

        return new GlobalSearchResults($results, $query);
    }

    public function render(): View
    {
        return view('livewire.custom-global-search', [
            'results' => $this->getResults($this->search),
        ]);
    }
}