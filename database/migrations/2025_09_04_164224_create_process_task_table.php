<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('process_task', function (Blueprint $table) {
        $table->id();
         $table->integer('process_id');
        $table->unsignedBigInteger('task_definition_id');
        $table->timestamps();

        $table->foreign('process_id')
          ->references('id')
          ->on('processos')
          ->onDelete('cascade');

        $table->foreign('task_definition_id')
          ->references('id')
          ->on('task_definitions')
          ->onDelete('cascade');
    });
    }

    public function down(): void
    {
        Schema::dropIfExists('process_task');
    }
};