<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\RelatorioController;
use App\Http\Controllers\ProcessoController;
use App\Http\Controllers\ModeloController;
use App\Http\Controllers\HelpController;
use App\Http\Controllers\QrSignerController;

// =======================
// Redirecionamentos Filament
// =======================
Route::get('/admin/processos/peticao-inicial/minutar-despacho/create', function () {
    return redirect()->route(
        'filament.admin.resources.processos.peticao-inicial.minutar-despachos.create',
        request()->query()
    );
})->name('filament.admin.resources.processos.peticao-inicial.minutar-despacho.create');

// =======================
// Modelos e E-Docs
// =======================
Route::get('/modelos/{slug}', [ModeloController::class, 'showBySlug'])->name('modelo.show');
Route::get('/modelos/{slug}/preview', [ModeloController::class, 'preview'])->name('modelos.preview');

Route::get('/e-docs/verify/{identifier}', [ModeloController::class, 'showBySlug'])
    ->where('identifier', '^[A-Za-z0-9._-]+$')
    ->name('edocs.verify');

// =======================
// Relatórios
// =======================
Route::get('/relatorio/processo/{processo}', [RelatorioController::class, 'relatorioDeProcesso'])
    ->name('relatorio.processo_especifico');

// =======================
// Processos CRUD
// =======================
Route::prefix('processos')->name('processos.')->group(function () {
    Route::get('/', [ProcessoController::class, 'index'])->name('index');
    Route::get('/create', [ProcessoController::class, 'create'])->name('create');
    Route::post('/', [ProcessoController::class, 'store'])->name('store');
    Route::get('/{processo}', [ProcessoController::class, 'show'])->name('show');
    Route::get('/{processo}/edit', [ProcessoController::class, 'edit'])->name('edit');
    Route::put('/{processo}', [ProcessoController::class, 'update'])->name('update');
    Route::delete('/{processo}', [ProcessoController::class, 'destroy'])->name('destroy');
});

// =======================
// Páginas principais
// =======================
Route::get('/', fn() => view('welcome'));
Route::get('/dashboard', fn() => view('dashboard'))
    ->middleware(['auth', 'verified'])
    ->name('dashboard');

// =======================
// Perfil do usuário
// =======================
Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

// =======================
// Ajuda e suporte
// =======================
Route::prefix('help')->name('help.')->group(function () {
    Route::get('/documentacao', [HelpController::class, 'documentation'])->name('documentation');
    Route::get('/suporte', [HelpController::class, 'support'])->name('support');
    Route::get('/faq', [HelpController::class, 'faq'])->name('faq');
    Route::get('/chamado', [HelpController::class, 'ticket'])->name('ticket');
    Route::get('/melhoria', [HelpController::class, 'suggestion'])->name('suggestion');
});

// =======================
// QR Code
// =======================
Route::get('/d/{token}', [QrSignerController::class, 'verifyPath'])->name('qr.verify.path');

Route::post('/qr/generate', [QrSignerController::class, 'generate']);
Route::get('/qr/verify', [QrSignerController::class, 'verify']);

// =======================
// Autenticação padrão Laravel
// =======================
require __DIR__.'/auth.php';