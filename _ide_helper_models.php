<?php

// @formatter:off
// phpcs:ignoreFile
/**
 * A helper file for your Eloquent Models
 * Copy the phpDocs from this file to the correct Model,
 * And remove them from this file, to prevent double declarations.
 *
 * @author Barry vd. Heuvel <barryvdh@gmail.com>
 */


namespace App\Models{
/**
 * @property int $id
 * @property string $numero
 * @property int $statusprocesso
 * @method static \Illuminate\Database\Eloquent\Builder<static>|CadastroProcesso newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|CadastroProcesso newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|CadastroProcesso query()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|CadastroProcesso whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|CadastroProcesso whereNumero($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|CadastroProcesso whereStatusprocesso($value)
 * @mixin \Eloquent
 */
	#[\AllowDynamicProperties]
	class IdeHelperCadastroProcesso {}
}

namespace App\Models{
/**
 * @property int $id
 * @property int $statusprocesso_id
 * @property string|null $pergunta
 * @property int|null $sim
 * @property int|null $nao
 * @property string|null $modelo
 * @property array<array-key, mixed>|null $perguntas_selecionadas
 * @property-read \App\Models\Modelo|null $textoDoModelo
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Fluxo newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Fluxo newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Fluxo query()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Fluxo whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Fluxo whereModelo($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Fluxo whereNao($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Fluxo wherePergunta($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Fluxo wherePerguntasSelecionadas($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Fluxo whereSim($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Fluxo whereStatusprocessoId($value)
 * @mixin \Eloquent
 */
	#[\AllowDynamicProperties]
	class IdeHelperFluxo {}
}

namespace App\Models{
/**
 * @property int $id
 * @property int $fluxo_id
 * @property string|null $titulo
 * @property string|null $texto
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Modelo newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Modelo newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Modelo query()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Modelo whereFluxoId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Modelo whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Modelo whereTexto($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Modelo whereTitulo($value)
 * @mixin \Eloquent
 */
	#[\AllowDynamicProperties]
	class IdeHelperModelo {}
}

namespace App\Models{
/**
 * @property int $id
 * @property string $numero
 * @property int $statusprocesso
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Processo newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Processo newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Processo query()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Processo whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Processo whereNumero($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Processo whereStatusprocesso($value)
 * @mixin \Eloquent
 */
	#[\AllowDynamicProperties]
	class IdeHelperProcesso {}
}

namespace App\Models{
/**
 * @property int $id
 * @property string|null $descricao
 * @property-read \Illuminate\Database\Eloquent\Collection<int, \App\Models\Processo> $processos
 * @property-read int|null $processos_count
 * @method static \Illuminate\Database\Eloquent\Builder<static>|StatusProcesso newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|StatusProcesso newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|StatusProcesso query()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|StatusProcesso whereDescricao($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|StatusProcesso whereId($value)
 * @mixin \Eloquent
 */
	#[\AllowDynamicProperties]
	class IdeHelperStatusProcesso {}
}

namespace App\Models{
/**
 * @property int $id
 * @property string $name
 * @property string $email
 * @property \Illuminate\Support\Carbon|null $email_verified_at
 * @property string $password
 * @property string|null $remember_token
 * @property \Illuminate\Support\Carbon|null $created_at
 * @property \Illuminate\Support\Carbon|null $updated_at
 * @property-read \Illuminate\Notifications\DatabaseNotificationCollection<int, \Illuminate\Notifications\DatabaseNotification> $notifications
 * @property-read int|null $notifications_count
 * @method static \Database\Factories\UserFactory factory($count = null, $state = [])
 * @method static \Illuminate\Database\Eloquent\Builder<static>|User newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|User newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|User query()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|User whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|User whereEmail($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|User whereEmailVerifiedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|User whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|User whereName($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|User wherePassword($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|User whereRememberToken($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|User whereUpdatedAt($value)
 * @mixin \Eloquent
 */
	#[\AllowDynamicProperties]
	class IdeHelperUser {}
}

