<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sugerir uma Melhoria</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 font-sans">
    <div class="container mx-auto mt-10 p-8 bg-white max-w-4xl rounded-lg shadow-md">
        <h1 class="text-4xl font-bold text-gray-800 mb-6">Sugerir uma Melhoria</h1>
        <p class="text-gray-700 text-lg">
            Sua opinião é muito importante! Deixe sua sugestão para melhorarmos o sistema.
        </p>

        <form class="mt-8 space-y-6">
            <div>
                <label for="suggestion_area" class="block text-sm font-medium text-gray-700">Área da Sugestão</label>
                <select id="suggestion_area" class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm">
                    <option>Interface do Usuário</option>
                    <option>Funcionalidades</option>
                    <option>Desempenho</option>
                    <option>Outro</option>
                </select>
            </div>
            <div>
                <label for="suggestion_text" class="block text-sm font-medium text-gray-700">Sua Sugestão</label>
                <textarea id="suggestion_text" rows="5" class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm"></textarea>
            </div>
            <button type="submit" class="w-full py-2 px-4 bg-blue-600 text-white font-semibold rounded-md hover:bg-blue-700">Enviar Sugestão</button>
        </form>

         <div class="mt-6">
             <a href="{{ url()->previous() }}" class="text-blue-500 hover:underline">← Voltar</a>
        </div>
    </div>
</body>
</html>