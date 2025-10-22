<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateQrSignaturesTable extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('qr_signatures', function (Blueprint $table) {
            // garante InnoDB (compatibilidade com FK)
            $table->engine = 'InnoDB';

            $table->id();

            // IMPORTANTE: tipo SIGNED integer para bater com modelo.id (int(11))
            $table->integer('document_id')->nullable();

            $table->string('payload_hash', 128);
            $table->longText('payload');
            $table->string('signature', 256);
            $table->string('qr_url')->nullable();
            $table->timestamp('expires_at')->nullable();
            $table->boolean('consumed')->default(false);
            $table->timestamps();

            $table->index('payload_hash');
            $table->index('document_id');

            $table->foreign('document_id')
                  ->references('id')
                  ->on('modelo')
                  ->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('qr_signatures');
    }
}