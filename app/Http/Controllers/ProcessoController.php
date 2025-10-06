<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Processo;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class ProcessoController extends Controller
{
    /**
     * Display a listing of processes and handle search by process number.
     */
    public function index(Request $request)
    {
        DB::enableQueryLog();

        $query = Processo::query();

        if ($request->filled('q')) {
            $raw = trim($request->q);

            // Keep only digits for numeric search
            $onlyDigits = preg_replace('/\D+/', '', $raw);

            if ($onlyDigits !== '' && strlen($onlyDigits) >= 3) {
                $pattern = "%{$onlyDigits}%";
                $query->whereRaw(
                    "REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(numero, '.', ''), '-', ''), '/', ''), ' ', ''), ',', '') LIKE ?",
                    [$pattern]
                );
            } else {
                // fallback: partial match including non-numeric characters
                $query->where('numero', 'like', '%' . $raw . '%');
            }
        }

        $processos = $query->orderBy('id', 'desc')
                           ->paginate(15)
                           ->withQueryString();

        Log::debug('ProcessoController@index queries', [
            'q' => $request->q ?? null,
            'queries' => DB::getQueryLog()
        ]);

        return view('processos.index', compact('processos'));
    }

    // --- Standard CRUD methods ---
    public function create()
    {
        return view('processos.create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'numero' => 'required|unique:processos,numero',
            'statusprocesso' => 'nullable|string|max:255',
        ]);

        Processo::create($request->only('numero', 'statusprocesso'));

        return redirect()->route('processos.index')
                         ->with('success', 'Process created successfully.');
    }

    public function show(Processo $processo)
    {
        return view('processos.show', compact('processo'));
    }

    public function edit(Processo $processo)
    {
        return view('processos.edit', compact('processo'));
    }

    public function update(Request $request, Processo $processo)
    {
        $request->validate([
            'numero' => 'required|unique:processos,numero,' . $processo->id,
            'statusprocesso' => 'nullable|string|max:255',
        ]);

        $processo->update($request->only('numero', 'statusprocesso'));

        return redirect()->route('processos.index')
                         ->with('success', 'Process updated successfully.');
    }

    public function destroy(Processo $processo)
    {
        $processo->delete();

        return redirect()->route('processos.index')
                         ->with('success', 'Process deleted successfully.');
    }
}