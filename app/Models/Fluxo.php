<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

/**
 * @mixin IdeHelperFluxo
 */
class Fluxo extends Model
{
    use HasFactory;

    protected $table = 'fluxo';
    protected $primaryKey = 'id';
    public $timestamps = false;

    protected $fillable = [
        'pergunta',
        'sim',
        'nao',
        'modelo',
        'statusprocesso_id',
        'perguntas_selecionadas', // ADICIONADO
    ];

    protected $casts = [
        'perguntas_selecionadas' => 'array', // ADICIONADO
    ];

    public function textoDoModelo()
    {
        return $this->belongsTo(Modelo::class, 'modelo');
    }
}