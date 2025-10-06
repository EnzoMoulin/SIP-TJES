<?php

namespace App\Filament\Pages;

use Filament\Pages\Page;
use Filament\Forms\Components\Select;
use Filament\Forms\Contracts\HasForms; // Adicionado
use Filament\Forms\Concerns\InteractsWithForms; // Adicionado
use Filament\Forms\Form;
use App\Models\StatusProcesso;
use App\Models\Processo;

// Implemente a interface HasForms
class Relatorios extends Page implements HasForms
{
    use InteractsWithForms; // Adicione o trait

    protected static string $view = 'filament.pages.relatorios';
    protected static ?string $navigationIcon = 'heroicon-o-document-text';
    protected static ?string $navigationLabel = 'Relatório';
    protected static ?string $title = 'Relatório Geral de Processos';

    public ?int $categoria_id = null;
    public ?int $processo_id = null;

    public function form(Form $form): Form
    {
        return $form
            ->schema([
                Select::make('categoria_id')
                    ->label('1. Categoria (opcional)')
                    ->options(StatusProcesso::pluck('descricao','id')->toArray())
                    ->placeholder('Todas as categorias')
                    ->reactive()
                    ->afterStateUpdated(fn ($state, callable $set) => $set('processo_id', null)),

                Select::make('processo_id')
                    ->label('2. Processo')
                    ->options(function ($get) {
                        $query = Processo::query();
                        if ($get('categoria_id')) {
                            $query->where('statusprocesso', $get('categoria_id'));
                        }
                        return $query->pluck('numero','id')->toArray();
                    })
                    ->placeholder('Todos os processos'),
            ]);
    }

    public function mount(): void
    {
        $this->form->fill([
            'categoria_id' => $this->categoria_id,
            'processo_id' => $this->processo_id,
        ]);
    }
}