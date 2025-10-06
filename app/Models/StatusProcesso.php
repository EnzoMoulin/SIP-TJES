<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

/**
 * @mixin IdeHelperStatusProcesso
 */
class StatusProcesso extends Model
{
    use HasFactory;

    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'statusprocesso';

    /**
     * Indicates if the model should be timestamped.
     * Lookup tables often do not have timestamps.
     *
     * @var bool
     */
    public $timestamps = false;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'descricao',
    ];

    /**
     * Get all of the processos for the StatusProcesso
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function processos(): HasMany
    {
        return $this->hasMany(Processo::class, 'statusprocesso', 'id');
    }
}