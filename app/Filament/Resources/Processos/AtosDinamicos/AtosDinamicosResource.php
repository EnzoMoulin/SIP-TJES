<?php

namespace App\Filament\Resources\Processos\AtosDinamicos;

use App\Filament\Resources\Processos\AtosDinamicos\AtosDinamicosResource\Pages;
use App\Models\Fluxo;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;

class AtosDinamicosResource extends Resource
{
    protected static ?string $model = Fluxo::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';
    protected static ?string $navigationGroup = 'Extra: Atos Dinâmicos';
    protected static ?string $modelLabel = 'Atos Dinâmicos';
    protected static ?string $pluralModelLabel = 'Atos Dinâmicos';
    
    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\Textarea::make('coluna1')
                    ->label('Conteúdo')
                    ->required()
                    ->rows(10)
                    ->columnSpanFull(),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('coluna1')
                    ->label('Conteúdo')
                    ->limit(100)
                    ->wrap(),
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ]);
    }

    public static function getRelations(): array
    {
        return [];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListAtosDinamicos::route('/'),
            'create' => Pages\CreateAtosDinamicos::route('/create'),
            'edit' => Pages\EditAtosDinamicos::route('/{record}/edit'),
        ];
    }
}
