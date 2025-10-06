<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
{
    Schema::table('modelo', function (Blueprint $table) {
        // Adiciona a regra correta: modelo.fluxo_id -> fluxo.id
        $table->foreign('fluxo_id')->references('id')->on('fluxo');
    });
}

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('modelos', function (Blueprint $table) {
            //
        });
    }
};
