<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\View\View;

class HelpController extends Controller
{
    /**
     * Show the documentation page.
     */
    public function documentation(): View
    {
        return view('help.documentation');
    }

    /**
     * Show the support page.
     */
    public function support(): View
    {
        return view('help.support');
    }

    // START: ADD THESE THREE NEW METHODS
    /**
     * Show the FAQ page.
     */
    public function faq(): View
    {
        return view('help.faq');
    }

    /**
     * Show the new ticket page.
     */
    public function ticket(): View
    {
        return view('help.ticket');
    }

    /**
     * Show the suggestion page.
     */
    public function suggestion(): View
    {
        return view('help.suggestion');
    }
    // END: ADD THESE THREE NEW METHODS
}