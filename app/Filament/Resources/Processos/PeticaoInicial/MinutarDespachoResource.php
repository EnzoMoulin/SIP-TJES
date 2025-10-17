<?php

namespace App\Filament\Resources\Processos\PeticaoInicial;

use App\Filament\Resources\Processos\PeticaoInicial\MinutarDespachoResource\Pages;
use App\Models\Fluxo;
use Filament\Resources\Resource;
use Filament\Forms;

class MinutarDespachoResource extends Resource
{
    protected static ?string $model = Fluxo::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';
    protected static ?string $navigationGroup = 'Tarefa: Petição Inicial';
    protected static ?string $pluralModelLabel = 'Minutar Despacho';
    protected static ?string $modelLabel = 'Minutar Despacho';

    public static function getRelations(): array
    {
        return [];
    }

    public static function getPages(): array
    {
        return [
            'index'  => Pages\ListMinutarDespachos::route('/'),
            'create' => Pages\CreateMinutarDespacho::route('/create'),
            'edit'   => Pages\EditMinutarDespacho::route('/{record}/edit'),
        ];
    }

    public static function getNavigationUrl(): string
    {
        return static::getUrl('create');
    }
}