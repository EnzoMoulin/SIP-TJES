<?php

namespace App\Http\Controllers;

use App\Models\Processo;
use Illuminate\Http\Request;
use Illuminate\View\View;

class RelatorioController extends Controller
{
    public function relatorioDeProcesso(Processo $processo): View
    {
        return view('relatorio.processo-especifico', [
            'processo' => $processo,
        ]);
    }

    public function todosProcessos(): View
    {
        $processos = Processo::all();

        return view('relatorio.todos-processos', [
            'processos' => $processos,
        ]);
    }
}