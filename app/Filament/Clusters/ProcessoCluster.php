<?php

namespace App\Filament\Clusters;

use Filament\Clusters\Cluster;

class ProcessoCluster extends Cluster
{
    protected static ?string $navigationIcon = 'heroicon-o-squares-2x2';
    protected static ?string $navigationLabel = 'Processo';
    protected static ?string $modelLabel = 'Processo ';
    protected static ?string $pluralModelLabel = 'Processos';
    protected static ?int $navigationSort = 1;
}