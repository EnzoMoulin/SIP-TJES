<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>{{ config('app.name', 'Laravel') }}</title>

    <link rel="stylesheet" href="https://fonts.bunny.net/css?family=inter:400,600,700&display=swap" />

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <link rel="stylesheet" href="{{ mix('css/app.css') }}">

    @livewireStyles
</head>
<body class="antialiased bg-gray-50 text-gray-900">

    <header class="bg-white shadow">
        <div class="max-w-7xl mx-auto py-4 px-4 sm:px-6 lg:px-8 flex items-center justify-between">
            <h1 class="text-xl font-semibold">{{ config('app.name', 'Laravel') }}</h1>
            {{-- Add navigation links here if needed --}}
        </div>
    </header>

    <main class="py-6">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            @if (session('success'))
                <div class="bg-green-100 text-green-800 p-3 rounded mb-4">
                    {{ session('success') }}
                </div>
            @endif

            @yield('content')
        </div>
    </main>

    <script src="{{ mix('js/app.js') }}"></script>

    @livewireScripts
    @stack('scripts')

    <script>
    document.addEventListener('livewire:load', function () {
        Livewire.on('openModelo', function(url) {
            if (url) {
                window.open(url, '_blank');
            }
        });
    });
    </script>

</body>
</html>