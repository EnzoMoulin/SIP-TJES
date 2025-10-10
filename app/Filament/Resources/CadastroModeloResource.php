<?php

namespace App\Filament\Resources;

use App\Filament\Resources\CadastroModeloResource\Pages;
use App\Filament\Resources\CadastroModeloResource\RelationManagers;
use App\Models\Modelo;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class CadastroModeloResource extends Resource
{
    protected static ?string $model = Modelo::class;
    
    protected static bool $isGloballySearchable = true;
    protected static ?string $recordTitleAttribute = 'titulo'; // Alterado de 'numero_processo' para 'titulo' (mais comum para Modelos)
    protected static ?string $navigationIcon = 'heroicon-o-list-bullet';
    protected static ?string $navigationLabel = 'Cadastro de Modelos';
    protected static ?string $modelLabel = 'Cadastro de Modelos';
    protected static ?string $pluralModelLabel = 'Cadastro de Modelos';
    protected static ?string $title = 'Cadastro de Modelos';
    protected static ?string $navigationGroup = 'Cadastros Variados';

    // Garante que o rótulo de navegação usa o valor desejado.
    public static function getNavigationLabel(): string
    {
        return static::$navigationLabel ?? (string) str(static::$modelLabel ?? static::$pluralModelLabel)
            ->headline();
    }
    
    // Método para ser chamado no AdminPanelProvider
    public static function getTitle(): string
    {
        return static::$title ?? 'Recurso Sem Título';
    }


    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\TextInput::make('titulo')
                    ->label('Título do Modelo')
                    ->required()
                    ->maxLength(255)
                    ->columnSpanFull(),

                Forms\Components\Textarea::make('texto')
                    ->label('Texto do Modelo')
                    ->required()
                    ->rows(15)
                    ->columnSpanFull(),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('titulo')
                    ->label('Título do Modelo'),
                Tables\Columns\TextColumn::make('texto')
                    ->label('Texto do Modelo'),
            ])
            ->filters([
                //
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
        return [
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index'  => Pages\ListCadastroModelos::route('/'),
            'create' => Pages\CreateCadastroModelo::route('/create'),
            'edit'   => Pages\EditCadastroModelo::route('/{record}/edit'),
        ];
    }
}