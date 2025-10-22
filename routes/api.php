<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Minimal placeholder file created to satisfy framework bootstrap.
| Add your API routes here.
|
*/

Route::get('/_health', function (Request $request) {
    return response()->json(['status' => 'ok']);
});