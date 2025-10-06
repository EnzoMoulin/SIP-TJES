<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Aplicação</title>
        <link rel="preconnect" href="https://fonts.bunny.net">
        <link href="https://fonts.bunny.net/css?family=instrument-sans:400,500,600" rel="stylesheet" />
        @vite('resources/css/app.css')
        @livewireStyles
    </head>
    <body class="bg-[#FDFDFC] dark:bg-[#0a0a0a] text-[#1b1b18] flex flex-col min-h-screen">
        
        <header class="p-6 lg:p-8 w-full max-w-7xl mx-auto">
            <h1 class="text-3xl font-bold mb-4">Bem vindo a aplicação do tribunal!</h1>
            <nav>
                <ul class="flex space-x-4">
                </ul>
            </nav>
        </header>

        <main class="flex-grow flex items-center justify-center p-6 lg:p-8">
            @livewire('nome-do-seu-componente')
        </main>

        @livewireScripts
    </body>
</html>