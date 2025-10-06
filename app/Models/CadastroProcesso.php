<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * @mixin IdeHelperCadastroProcesso
 */
class CadastroProcesso extends Model
{
    protected $table = 'processos';
    protected $primaryKey = 'id';
    public $timestamps = false;
    protected $fillable = [
        'numero',
        'statusprocesso',
    ];
}