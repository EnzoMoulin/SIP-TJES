<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Abrir um Chamado</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 font-sans">
    <div class="container mx-auto mt-10 p-8 bg-white max-w-4xl rounded-lg shadow-md">
        <h1 class="text-4xl font-bold text-gray-800 mb-6">Abrir um Chamado</h1>
        <p class="text-gray-700 text-lg">
            Por favor, descreva seu problema em detalhes para que possamos ajudar.
        </p>

        <form class="mt-8 space-y-6">
            <div>
                <label for="subject" class="block text-sm font-medium text-gray-700">Assunto</label>
                <input type="text" id="subject" class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm">
            </div>
            <div>
                <label for="description" class="block text-sm font-medium text-gray-700">Descrição do Problema</label>
                <textarea id="description" rows="5" class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm"></textarea>
            </div>
            <button type="submit" class="w-full py-2 px-4 bg-blue-600 text-white font-semibold rounded-md hover:bg-blue-700">Enviar Chamado</button>
        </form>

         <div class="mt-6">
             <a href="{{ url()->previous() }}" class="text-blue-500 hover:underline">← Voltar</a>
        </div>
    </div>
</body>
</html>