<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Suporte</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 font-sans">
    <div class="container mx-auto mt-10 p-8 bg-white max-w-4xl rounded-lg shadow-md">
        <h1 class="text-4xl font-bold text-gray-800 mb-6">Falar com Suporte</h1>
        <p class="text-gray-700 text-lg">
            Precisa de ajuda? Entre em contato com nossa equipe de suporte.
        </p>

        <form class="mt-8 space-y-6">
            <div>
                <label for="email" class="block text-sm font-medium text-gray-700">Seu Email</label>
                <input type="email" id="email" class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500">
            </div>
            <div>
                <label for="message" class="block text-sm font-medium text-gray-700">Sua Mensagem</label>
                <textarea id="message" rows="4" class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500"></textarea>
            </div>
            <button type="submit" class="w-full py-2 px-4 bg-blue-600 text-white font-semibold rounded-md hover:bg-blue-700">Enviar Mensagem</button>
        </form>

         <div class="mt-6">
             <a href="{{ url()->previous() }}" class="text-blue-500 hover:underline">← Voltar</a>
        </div>
    </div>
</body>
</html>