<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Documentação</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 font-sans">
    <div class="container mx-auto mt-10 p-8 bg-white max-w-4xl rounded-lg shadow-md">
        <h1 class="text-4xl font-bold text-gray-800 mb-6">Página de Documentação</h1>
        <p class="text-gray-700 text-lg">
            Aqui você encontrará toda a documentação necessária para utilizar o sistema.
        </p>
        
        <div class="mt-8">
            <h2 class="text-2xl font-semibold text-gray-800 mb-4">Primeiros Passos</h2>
            <p class="text-gray-600">
                Instruções detalhadas sobre como começar a usar a plataforma, configurar seu perfil e muito mais.
            </p>
        </div>

        <div class="mt-6">
             <a href="{{ url()->previous() }}" class="text-blue-500 hover:underline">← Voltar</a>
        </div>
    </div>
</body>
</html>