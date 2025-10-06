<?php

namespace App\Http\Controllers;

use App\Models\Processos\PeticaoInicial\MinutarDecisaoInicialUrgencia;
use Illuminate\Http\Request;

class MinutarDecisaoInicialUrgenciaController extends Controller
{
    public function create()
    {
        return view('minutar.create');
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'coluna1' => 'required|string|max:255',
            'coluna2' => 'nullable|string|max:255',
        ]);

        MinutarDecisaoInicialUrgenciaController::create($validated);

        return redirect()->route('minutar.create')->with('success', 'Registro criado com sucesso!');
    }
}
