<?php

namespace App\Filament\Resources\Processos\BuscaeApreensao;

use App\Filament\Resources\Processos\BuscaeApreensao\ClasseBAAFn81Resource\Pages;
use App\Models\Fluxo;
use Filament\Resources\Resource;

class ClasseBAAFn81Resource extends Resource
{
    protected static ?string $model = Fluxo::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';
    protected static ?string $navigationGroup = 'Classe: Busca e Apreensão';
    protected static ?string $pluralModelLabel = 'Classe - BAAF (n°81)';
    protected static ?string $modelLabel = 'Classe - BAAF (n°81)';
    protected static ?string $title = 'Classe - BAAF (n°81)';

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
            'index'  => Pages\ListClasseBAAFn81s::route('/'),
            'create' => Pages\CreateClasseBAAFn81::route('/create'),
            'edit'   => Pages\EditClasseBAAFn81::route('/{record}/edit'),
        ];
    }
}
