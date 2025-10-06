<?php

namespace App\Filament\Resources;

use App\Filament\Resources\CadastroProcessoResource\Pages;
use App\Filament\Resources\CadastroProcessoResource\RelationManagers;
use App\Models\Processo;
use App\Models\StatusProcesso;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class CadastroProcessoResource extends Resource
{
    protected static ?string $model = Processo::class;
    
    protected static bool $isGloballySearchable = true;
    protected static ?string $recordTitleAttribute = 'numero_processo';
    protected static ?string $navigationIcon = 'heroicon-o-list-bullet';
    protected static ?string $navigationLabel = 'Cadastro de Processos';
    protected static ?string $modelLabel = 'Cadastro de Processos';
    protected static ?string $pluralModelLabel = 'Cadastro de Processos';
    protected static ?string $title = 'Cadastro de Processos';
    protected static ?string $navigationGroup = 'Cadastro';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\TextInput::make('numero')
                    ->label('Número do Processo')
                    ->required()
                    ->maxLength(255)
                    ->columnSpanFull(),

                Forms\Components\Select::make('statusprocesso')
                    ->label('Tipo de Processo')
                    ->options(StatusProcesso::all()->pluck('descricao', 'id'))
                    ->required()
                    ->columnSpanFull(),
            ]);
    }

     public static function table(Table $table): Table
     {
         return $table
             ->columns([
                 Tables\Columns\TextColumn::make('numero')
                     ->label('Número do Processo'),
                 Tables\Columns\TextColumn::make('statusprocesso')
                     ->label('Tipo de Processo'),
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
            'index'  => Pages\ListCadastroProcesso::route('/'),
            'create' => Pages\CreateCadastroProcesso::route('/create'),
            'edit'   => Pages\EditCadastroProcesso::route('/{record}/edit'),
        ];
    }
}