<?php

namespace App\Filament\Resources;

use App\Filament\Resources\CadastroOrgaoResource\Pages;
use App\Models\CadastroOrgao;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;

class CadastroOrgaoResource extends Resource
{
    protected static ?string $model = CadastroOrgao::class;

    protected static ?string $navigationIcon = 'heroicon-o-building-office';
    protected static ?string $navigationGroup = 'Cadastros Variados';
    protected static ?string $modelLabel = 'Cadastro de Órgão';
    protected static ?string $pluralModelLabel = 'Cadastro de Órgãos';
    protected static ?string $navigationLabel = 'Cadastro de Órgãos';
    protected static ?string $title = 'Cadastro de Órgãos';
    protected static ?int $navigationSort = 1;

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\TextInput::make('nome')
                    ->label('Nome do Órgão')
                    ->required()
                    ->maxLength(255),

                Forms\Components\Textarea::make('descricao')
                    ->label('Descrição')
                    ->maxLength(500),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('id')
                    ->sortable()
                    ->label('ID'),

                Tables\Columns\TextColumn::make('nome')
                    ->searchable()
                    ->sortable()
                    ->label('Nome'),

                Tables\Columns\TextColumn::make('descricao')
                    ->label('Descrição')
                    ->limit(50),
            ])
            ->filters([])
            ->actions([
                Tables\Actions\EditAction::make(),
                Tables\Actions\DeleteAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\DeleteBulkAction::make(),
            ]);
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListCadastroOrgaos::route('/'),
            'create' => Pages\CreateCadastroOrgao::route('/create'),
            'edit' => Pages\EditCadastroOrgao::route('/{record}/edit'),
        ];
    }
}