<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Storage;
use SimpleSoftwareIO\QrCode\Facades\QrCode;
use Carbon\Carbon;

class QrSignature extends Model
{
    use HasFactory;

    protected $table = 'qr_signatures';

    protected $fillable = [
        'document_id',
        'payload_hash',
        'payload',
        'signature',
        'qr_url',
        'expires_at',
        'consumed',
    ];

    protected $casts = [
        'expires_at' => 'datetime',
        'consumed' => 'boolean',
    ];

    /**
     * Boot model: gera payload/hash/signature/qr_url automaticamente ao criar.
     */
    protected static function booted()
    {
        static::creating(function (QrSignature $model) {
            try {
                // 1) Payload básico (não depende de signature)
                if (empty($model->payload)) {
                    $model->payload = json_encode([
                        'doc_id' => $model->document_id,
                        'nonce' => (string) Str::uuid(),
                        'ts' => now()->toDateTimeString(),
                    ], JSON_UNESCAPED_UNICODE);
                }

                // 2) payload_hash (obrigatório na migration)
                $model->payload_hash = hash('sha256', $model->payload);

                // 3) signature: HMAC-256 + base64url (substitua por openssl_sign se preferir)
                $appKey = config('app.key') ?? Str::random(32);
                $rawSig = hash_hmac('sha256', $model->payload_hash, $appKey, true);
                $model->signature = rtrim(strtr(base64_encode($rawSig), '+/', '-_'), '=');

                // 4) expires_at e consumed defaults
                if (empty($model->expires_at)) {
                    $ttl = intval(env('QR_SIGNER_TOKEN_TTL_SECONDS', 86400));
                    $model->expires_at = Carbon::now()->addSeconds($ttl);
                }
                if (! isset($model->consumed)) {
                    $model->consumed = false;
                }

                // 5) Geração do QR como SVG e persistência em storage/app/public/qrs
                //    Recomendado: execute php artisan storage:link para expor via /storage/...
                $base = env('EDOCS_BASE_URL', url('/'));
                $verifyUrl = rtrim($base, '/') . '/d/' . rawurlencode((string) $model->signature);

                // Gera SVG (string)
                $svg = QrCode::format('svg')->size(300)->generate($verifyUrl);

                // Nome de arquivo seguro
                $fileName = 'qrs/qr_' . Str::slug(substr((string)$model->signature, 0, 16)) . '_' . time() . '.svg';

                // Salva no disk public (storage/app/public/qrs)
                Storage::disk('public')->put($fileName, $svg);

                // Monta URL pública via storage symlink
                $model->qr_url = Storage::url($fileName);
            } catch (\Throwable $e) {
                // Loga o erro e permite que a criação prossiga (mas qr_url pode ficar null)
                logger()->warning('QrSignature: falha ao gerar QR: ' . $e->getMessage());
                // se payload_hash não estiver definido por algum motivo, definimos algo mínimo
                if (empty($model->payload_hash)) {
                    $model->payload_hash = hash('sha256', (string) $model->payload);
                }
                if (empty($model->signature)) {
                    $model->signature = rtrim(strtr(base64_encode(hash('sha256', (string) $model->payload)), '+/', '-_'), '=');
                }
            }
        });
    }

    /**
     * Relação com o modelo (documento).
     */
    public function modelo()
    {
        return $this->belongsTo(Modelo::class, 'document_id', 'id');
    }

    /**
     * Verifica se o token ainda é válido.
     */
    public function isValid(): bool
    {
        if ($this->consumed) return false;
        if ($this->expires_at && $this->expires_at->isPast()) return false;
        return true;
    }

    /**
     * Marca como consumido.
     */
    public function consume(): void
    {
        $this->consumed = true;
        $this->save();
    }
}