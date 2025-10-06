<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * @mixin IdeHelperModelo
 */
class Modelo extends Model
{
    protected $table = 'modelo';
    protected $primaryKey = 'id';
    public $timestamps = false;
    protected $fillable = [
        'fluxo_id',
        'titulo',
        'texto'
    ];
}