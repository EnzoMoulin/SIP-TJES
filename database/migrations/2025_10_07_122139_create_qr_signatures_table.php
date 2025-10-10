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
     Schema::create('qr_signatures', function (Blueprint $table) {
    $table->id();
    $table->unsignedBigInteger('document_id');
    $table->string('payload_hash', 64);
    $table->text('payload');
    $table->text('signature');
    $table->string('qr_url');
    $table->timestamp('expires_at')->nullable();
    $table->boolean('consumed')->default(false);
    $table->timestamps();
});
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('qr_signatures');
    }
};
