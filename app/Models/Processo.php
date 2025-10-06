<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * @mixin IdeHelperProcesso
 */
class Processo extends Model
{
    protected $table = 'processos';
    protected $primaryKey = 'id';
    public $timestamps = false;
    protected $fillable = [
        'numero',
        'statusprocesso',
    ];
}