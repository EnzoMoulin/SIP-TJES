<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Relatório do Processo {{ $processo->numero }}</title>
    <style>
        body { font-family: system-ui, sans-serif; line-height: 1.6; margin: 0; padding: 2rem; }
        .container { max-width: 800px; margin: auto; padding: 2rem; border: 1px solid #e2e8f0; border-radius: 0.5rem; }
        h1 { border-bottom: 2px solid #f3f4f6; padding-bottom: 1rem; margin-top: 0;}
        p { margin: 0.5rem 0; }
        strong { display: inline-block; min-width: 180px; }
        .print-button { display: block; width: 100%; padding: 1rem; margin-top: 2rem; font-size: 1rem; font-weight: bold; color: white; background-color: #f59e0b; border: none; border-radius: 0.5rem; cursor: pointer; }
        @media print { .no-print { display: none; } }
    </style>
</head>
<body>
    <div class="container">
        <h1>Detalhes do Processo</h1>
        <p><strong>ID do Registro:</strong> {{ $processo->id }}</p>
        <p><strong>Número do Processo:</strong> {{ $processo->numero }}</p>
        <p><strong>ID do Status do Processo:</strong> {{ $processo->statusprocesso }}</p>
        <button onclick="window.print()" class="print-button no-print">Imprimir Relatório</button>
    </div>
</body>
</html>