<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('fluxo', function (Blueprint $table) {
            // Esta linha cria a coluna especial do tipo JSON
            $table->json('perguntas_selecionadas')->nullable()->after('modelo');
        });
    }

    public function down(): void
    {
        Schema::table('fluxo', function (Blueprint $table) {
            $table->dropColumn('perguntas_selecionadas');
        });
    }
};