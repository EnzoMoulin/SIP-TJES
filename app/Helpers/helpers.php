<?php

use Illuminate\Support\Str;

if (!function_exists('slugify')) {
    function slugify(string $text): string {
        // Remove acentos
        $text = iconv('UTF-8', 'ASCII//TRANSLIT', $text);

        // Substitui espaços e caracteres inválidos por hífen
        $text = preg_replace('/[^A-Za-z0-9]+/', '-', $text);

        // Remove hífens duplos e trim
        $text = trim(preg_replace('/-+/', '-', $text), '-');

        // Minúsculas
        return strtolower($text);
    }
}