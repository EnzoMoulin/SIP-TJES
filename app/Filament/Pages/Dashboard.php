<?php

namespace App\Filament\Pages;

use Filament\Pages\Dashboard as BaseDashboard;

class Dashboard extends BaseDashboard
{
    protected static ?string $navigationIcon = 'heroicon-o-home';

    public function getWidgets(): array
    {
        return [
            \App\Filament\Widgets\DashboardResumo::class,
            \App\Filament\Widgets\DashboardTipo::class,
            \App\Filament\Widgets\DashboardQuantidade::class,
        ];
    }
}