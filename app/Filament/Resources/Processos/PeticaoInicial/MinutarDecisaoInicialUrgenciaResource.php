<?php

namespace App\Filament\Resources\Processos\PeticaoInicial;

use App\Filament\Resources\Processos\PeticaoInicial\MinutarDecisaoInicialUrgenciaResource\Pages;
use App\Models\Fluxo;
use Filament\Resources\Resource;
use Filament\Navigation\NavigationItem; // This line can be removed too, but is not required

class MinutarDecisaoInicialUrgenciaResource extends Resource
{
    protected static ?string $model = Fluxo::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';
    protected static ?string $navigationGroup = 'Tarefa: Petição Inicial';
    protected static ?string $modelLabel = 'Minutar Decisão Inicial Urgência';
    protected static ?string $pluralModelLabel = 'Minutar Decisão Inicial Urgência';

    public static function getRelations(): array
    {
        return [];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListMinutarDecisaoInicialUrgencias::route('/'),
            'create' => Pages\CreateMinutarDecisaoInicialUrgencia::route('/create'),
        ];
    }

    /*
     * THIS ENTIRE FUNCTION SHOULD BE DELETED
     *
    public static function getNavigationItems(): array
    {
        return [
            NavigationItem::make(static::$pluralModelLabel)
                ->url(route('filament.admin.resources.processos.peticao-inicial.minutar-decisao-inicial-urgencias.create'))
                ->icon(static::$navigationIcon)
                ->group(static::$navigationGroup),
        ];
    }
    */

    public static function getNavigationUrl(): string
    {
        // This function is correct and should remain.
        return route('filament.admin.resources.processos.peticao-inicial.minutar-decisao-inicial-urgencias.create');
    }
}