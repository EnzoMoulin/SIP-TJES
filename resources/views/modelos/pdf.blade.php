<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8" />
<title>{{ $modelo->titulo ?? 'Modelo de Documento' }}</title>
<style>
@page { margin: 175px 50px 50px 50px; }

body {
    font-family: "DejaVu Sans", sans-serif;
    font-size: 12px;
    line-height: 1.55;
    color: #222;
    margin-top: -50px;
}

header {
    position: fixed;
    top: -200px;
    left: 0;
    right: 0;
    height: 125px;
    border-bottom: 2px solid #e6e6e6;
    padding-bottom: 5px;
    z-index: 1000;
    box-sizing: border-box;
}

.brand {
    display: flex;
    align-items: center;
    gap: 12px;
    padding: 12px 50px;
    box-sizing: border-box;
}

.brand img {
    height: 350px;
    display: block;
    margin-top: -30px;
    margin-left: -77.5px;
}

.header-right {
    position: absolute;
    right: 0;
    top: 60px;
    text-align: right;
    box-sizing: border-box;
}

.header-right .system {
    font-weight: 600;
    font-size: 18px;
    color: #333;
    margin-bottom: 2px;
}

.header-right .court {
    font-weight: 600;
    font-size: 18px;
    color: #333;
}

main {
    margin: 75px 50px 30px 50px;
    text-align: justify;
    font-size: 12px;
}

h1 {
    font-size: 20px;
    text-align: center;
    margin: -50px 0 5px 0;
    color: #1f2937;
    line-height: 1.05;
}

.subtitle-hr {
    height: 1px;
    background: #e6e6e6;
    margin: 8px 0 18px;
}

.content p {
    text-indent: 1.2em;
    margin: 0 0 10px 0;
    hyphens: auto;
}

.last-page-wrapper {
    margin: 0 10px 0 10px;
    box-sizing: border-box;
    clear: both;
    page-break-inside: avoid;
}

.signature-block {
    text-align: center;
    line-height: 1.4;
    font-size: 11px;
    margin-bottom: 25px;
    color: #222;
}

.signature-block .name {
    font-weight: 700;
    font-size: 12px;
    margin-bottom: -10px;
    margin-top: -5px;
}

.signature-block .legal-text {
    font-size: 11px;
}

.qr-validation-wrapper {
    background: #fceaf3b9;
    padding: 20px;
    box-sizing: border-box;
    page-break-inside: avoid;
    overflow: hidden;
}

.qr-section {
    float: left;
    width: 135px;
    margin-right: 13.5px;
    box-sizing: border-box;
}

.qr-code-label {
    font-size: 10px;
    color: #2289ffe0;
    font-weight: bold;
    margin-bottom: 5px;
    margin-top: -5px;
}

.qr-section img {
    display: block;
    width: 103px !important;
    height: 103px !important;
    border: 5px solid #ffcee3ff;
    padding: 10px;
    box-sizing: border-box;
    object-fit: contain;
    background: #fff;
}

.document-info {
    overflow: visible;
    font-size: 12px;
    line-height: 1.25;
    color: #0b2e16;
}

.info-title {
    font-weight: 800;
    margin-bottom: 5px;
    text-transform: uppercase;
}

.legal-value {
    font-weight: 700;
    color: #000;
}

.verification-link {
    color: #2289ffe0;
    text-decoration: underline;
    word-break: break-all;
}

</style>
</head>

<body>
<header>
<div class="brand">
<img src="file://{{ public_path('images/logo3.png') }}" alt="Logo">
</div>

<div class="header-right">
    <div class="system">Sistema Jurídico - SIP</div>
    <div class="court">Vara de (Nome Genérico)</div>
</div>
</header>

<main>
<h1>{{ $modelo->titulo ?? 'Modelo sem título' }}</h1>
<div class="subtitle-hr"></div>

<div class="content">
    @if(!empty($modelo->texto))
        {!! $modelo->texto !!}
    @else
        <p style="text-align:center; font-weight:600;">Atenção: Este modelo não possui conteúdo definido.</p>
    @endif
</div>

</main>

<div style="page-break-before: always;"></div>

<div class="last-page-wrapper">
<div class="signature-block">
<p class="legal-text">
Documento original assinado eletronicamente, conforme MP 2200-2/2001, art. 10, § 2º, por:
</p>
<p class="name">{{ $signedBy ?? 'FELLIPE ALVES DUARTE' }}</p>
<p>CIDADÃO</p>
<p>assinado em {{ $capturedAt ?? now()->setTimezone('America/Sao_Paulo')->format('d/m/Y H:i:s') }}</p>
</div>

<div class="qr-validation-wrapper">
    <div class="qr-section">
        <div class="qr-code-label">QR Code de Validação</div>

        @if(!empty($qrSvgRaw))
            <div style="width:100px; height:100px; display:block; padding: 6px; border: 4px solid #ffb6d6ff; background: #fff; box-sizing: border-box;">
                {!! $qrSvgRaw !!}
            </div>
        @elseif(!empty($qrBase64))
            <img
                alt="QR Code"
                src="{{ $qrBase64 }}"
                style="width:100px; height:100px; border:4px solid #ffb6d685; display:block; object-fit:contain; background:#fff; padding: 6px;"
                onerror="this.style.display='block'; this.src='data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR4nGNgYAAAAAMAASsJTYQAAAAASUVORK5CYII='"
            >
        @else
            <div style="width:100px; height:100px; border:4px solid #ffb6d6ff; background:#fff; display:block; padding: 6px;"></div>
        @endif
    </div>

    <div class="document-info">
        <div class="info-title">INFORMAÇÕES DO DOCUMENTO</div>

        <div>Documento capturado em {{ $capturedAt ?? now()->setTimezone('America/Sao_Paulo')->format('d/m/Y H:i:s') }} (HORÁRIO DE BRASÍLIA - UTC-3)</div>
        <div>por {{ $signedBy ?? 'FELLIPE ALVES DUARTE' }} (CIDADÃO)</div>
        <div>
            Valor Legal: <span class="legal-value">{{ $legalValue ?? 'ORIGINAL' }}</span>
            | Natureza: {{ $nature ?? 'DOCUMENTO NATO-DIGITAL' }}
        </div>
        <div style="margin-top:25px;">A disponibilidade do documento pode ser conferida pelo link:</div>
        <div>
            <a
                class="verification-link"
                href="{{ $verificationUrl ?? '#' }}"
                target="_blank"
                rel="noopener noreferrer"
            >
                {{ $verificationUrl ?? 'https://e-docs.es.gov.br/d/2025-FZH3TS' }}
            </a>
        </div>
    </div>

    <div style="clear: both;"></div>
</div>

</div>
</body>
</html>