<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<title>{{ $modelo->titulo ?? 'Modelo de Documento' }}</title>
<style>
@page { margin: 175px 50px 150px 50px; }

body {
    font-family: "DejaVu Sans", sans-serif;
    font-size: 12px;
    line-height: 1.55;
    color: #222;
    margin: 0;
    margin-top: -50px;
}

header {
    position: fixed;
    top: -150px;
    left: 0;
    right: 0;
    height: 75px;
    text-align: center;
    border-bottom: 2px solid #e6e6e6;
    padding-bottom: 10px;
    z-index: 1000;
}

header .brand { display: flex; 
    align-items: center; 
    justify-content: center; 
    gap: 12px; 
}

header img { 
    height: 290px;
    margin-top: -35px;
}

header .system { 
    margin-top: 5px; 
    font-size: 14px; 
    color: #666; 
    font-weight: 600; 
}

header .court { 
    margin-bottom: 5px; 
    font-size: 14px; 
    color: #444; 
    font-weight: 400; 
}

h1 { 
    font-size: 20px; 
    text-align: center; 
    margin: -75px 0 -15px 0; 
    color: #1f2937; 
    line-height: 1.05; 
}

.subtitle-hr { 
    height: 1px; 
    background: linear-gradient(90deg, rgba(0,0,0,0.06), rgba(0,0,0,0.02)); 
    margin: 8px 0 18px 0; 
}

main { 
    margin: 75px 12px; 
    text-align: justify; 
    font-size: 12px;
}

.content p { 
    text-indent: 1.2em; 
    margin: 0 0 10px 0; 
    hyphens: auto; 
}

.signature-lateral {
    font-weight: bold;
    color: rgba(120,120,120,0.35);
}

p, h1 { page-break-inside: avoid; }
</style>
</head>
<body>

<header>
        <div class="brand", style="margin-right: 325px;" >
        <img src="file://{{ public_path('images/logo3.png') }}" alt="Logo TJES">
   

    </div >
     <div style="margin-top: -232px ; margin-left: 480px ; font-weight:600 ; font-size: 18px" class="system">Sistema Jurídico - SIP</div>
    <div class="court" style=" margin-left: 480px; font-weight:600; font-size: 18px">Vara de (Nome Genérico)</div>
</header>

<main>
    <h1>{{ $modelo->titulo ?? 'Modelo sem título' }}</h1>
    <div class="subtitle-hr" aria-hidden="true"></div>

    <div class="content">
        @if(!empty($modelo->texto))
            {!! $modelo->texto !!}
        @else
            <p style="text-align:center; font-weight:600;">
                Atenção: Este modelo não possui conteúdo definido.
            </p>
        @endif
    </div>
</main>

</body>
</html>