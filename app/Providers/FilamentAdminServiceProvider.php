<?php

namespace App\Providers;

use Filament\Pages\Dashboard;
use Filament\PluginServiceProvider;
use Illuminate\Support\ServiceProvider;

class FilamentAdminServiceProvider extends ServiceProvider
{
    public function boot(): void
    {
        // Força o caminho e middleware do Filament
        \Filament\Facades\Filament::serving(function () {
            \Filament\Facades\Filament::registerNavigationGroups([]);
        });
    }
}