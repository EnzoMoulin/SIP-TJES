<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\RelatorioController;
use App\Http\Controllers\ProcessoController;
use App\Http\Controllers\ModeloController;
use App\Http\Controllers\HelpController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
*/

// Rota para exibir um Modelo pelo seu SLUG (nome amigável na URL)
Route::get('/modelos/{slug}', [ModeloController::class, 'showBySlug'])->name('modelo.show');

// Rota para o relatório de processo específico
Route::get('/relatorio/processo/{processo}', [RelatorioController::class, 'relatorioDeProcesso'])
    ->name('relatorio.processo_especifico');


Route::prefix('processos')->name('processos.')->group(function () {
    Route::get('/', [ProcessoController::class, 'index'])->name('index');
    Route::get('/create', [ProcessoController::class, 'create'])->name('create');
    Route::post('/', [ProcessoController::class, 'store'])->name('store');
    Route::get('/{processo}', [ProcessoController::class, 'show'])->name('show');
    Route::get('/{processo}/edit', [ProcessoController::class, 'edit'])->name('edit');
    Route::put('/{processo}', [ProcessoController::class, 'update'])->name('update');
    Route::delete('/{processo}', [ProcessoController::class, 'destroy'])->name('destroy');
});

Route::get('/', function () {
    return view('welcome');
});

Route::get('/dashboard', function () {
    return view('dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});


Route::get('/documentacao', [HelpController::class, 'documentation'])->name('help.documentation');
Route::get('/suporte', [HelpController::class, 'support'])->name('help.support');

// START: ADD THESE THREE NEW ROUTES
Route::get('/faq', [HelpController::class, 'faq'])->name('help.faq');
Route::get('/chamado', [HelpController::class, 'ticket'])->name('help.ticket');
Route::get('/melhoria', [HelpController::class, 'suggestion'])->name('help.suggestion');
// END: ADD THESE THREE NEW ROUTES

require __DIR__.'/auth.php';

