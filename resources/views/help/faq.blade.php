<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Perguntas Frequentes (FAQ)</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 font-sans">
    <div class="container mx-auto mt-10 p-8 bg-white max-w-4xl rounded-lg shadow-md">
        <h1 class="text-4xl font-bold text-gray-800 mb-6">Perguntas Frequentes (FAQ)</h1>
        
        <div class="space-y-4">
            <div>
                <h3 class="font-semibold text-lg">Como eu altero minha senha?</h3>
                <p class="text-gray-600">Você pode alterar sua senha na seção "Meu Perfil" após fazer login.</p>
            </div>
            <div>
                <h3 class="font-semibold text-lg">Onde encontro meus chamados abertos?</h3>
                <p class="text-gray-600">Todos os seus chamados estão listados na página "Meus Chamados".</p>
            </div>
        </div>

        <div class="mt-8">
            <a href="{{ url()->previous() }}" class="text-blue-500 hover:underline">← Voltar</a>
        </div>
    </div>
</body>
</html>