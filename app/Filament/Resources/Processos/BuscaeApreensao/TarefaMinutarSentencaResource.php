<?php

namespace App\Filament\Resources\Processos\BuscaeApreensao;

use App\Filament\Resources\Processos\BuscaeApreensao\TarefaMinutarSentencaResource\Pages;
use App\Models\Fluxo;
use Filament\Resources\Resource;

class TarefaMinutarSentencaResource extends Resource
{
    protected static ?string $model = Fluxo::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';
    protected static ?string $navigationGroup = 'Classe: Busca e Apreensão';
    protected static ?string $pluralModelLabel = 'Tarefa - Minutar Sentença';
    protected static ?string $modelLabel = 'Tarefa - Minutar Sentença';

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
            'index'  => Pages\ListTarefaMinutarSentencas::route('/'),
            'create' => Pages\CreateTarefaMinutarSentenca::route('/create'),
            'edit'   => Pages\EditTarefaMinutarSentenca::route('/{record}/edit'),
        ];
    }
}