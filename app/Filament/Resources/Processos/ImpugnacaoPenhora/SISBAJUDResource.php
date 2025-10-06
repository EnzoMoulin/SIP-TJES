<?php

namespace App\Filament\Resources\Processos\ImpugnacaoPenhora;

use App\Filament\Resources\Processos\ImpugnacaoPenhora\SISBAJUDResource\Pages;
use App\Models\Fluxo;
use Filament\Resources\Resource;

class SISBAJUDResource extends Resource
{
    protected static ?string $model = Fluxo::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';
    protected static ?string $navigationGroup = 'Etiqueta: Impugnação à Penhora';
    protected static ?string $pluralModelLabel = 'Impugnação à Penhora - SISBAJUD';
    protected static ?string $modelLabel = 'Impugnação à Penhora - SISBAJUD';
    protected static ?string $navigationLabel = 'Impugnação à Penhora - SISBAJUD';

    public static function getNavigationUrl(): string
    {
        return static::getUrl('create');
    }

    public static function getRelations(): array
    {
        return [];
    }

    public static function getPages(): array
    {
        return [
            'index'  => Pages\ListSISBAJUDS::route('/'),
            'create' => Pages\CreateSISBAJUD::route('/create'),
            'edit'   => Pages\EditSISBAJUD::route('/{record}/edit'),
        ];
    }
}