{{-- resources/views/components/floating-help-button.blade.php --}}

<style>
    .floating-help-container {
        position: fixed;
        bottom: 2rem;
        right: 2rem;
        z-index: 1000;
        cursor: pointer;
    }

    .help-button {
        width: 60px;
        height: 60px;
        background-color: #0C0A39;
        color: white;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 28px;
        font-weight: bold;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
        transition: background-color 0.3s ease;
    }

    .help-button:hover {
        background-color: #F6ADCD;
    }

    .help-menu {
        position: absolute;
        bottom: calc(100% + 10px);
        right: 0;
        width: 250px;
        background-color: white;
        border-radius: 8px;
        box-shadow: 0 6px 20px rgba(0, 0, 0, 0.15);
        padding: 0.5rem;
        list-style: none;
        margin: 0;
        opacity: 0;
        visibility: hidden;
        transform: translateY(10px);
        transition: opacity 0.3s ease, transform 0.3s ease, visibility 0.3s;
    }

    .floating-help-container:hover .help-menu {
        opacity: 1;
        visibility: visible;
        transform: translateY(0);
    }

    .help-menu a {
        display: block;
        padding: 0.75rem 1rem;
        color: #333;
        text-decoration: none;
        border-radius: 6px;
        transition: background-color 0.2s ease, color 0.2s ease;
    }

    .help-menu a:hover {
        background-color: #f0f0f0;
        color: #000;
    }
</style>

<div class="floating-help-container">
    <ul class="help-menu">
        {{-- ALL LINKS ARE NOW FUNCTIONAL --}}
        <li><a href="{{ route('help.ticket') }}" target="_blank">Abrir um Chamado</a></li>
        <li><a href="{{ route('help.documentation') }}" target="_blank">Ver Documentação</a></li>
        <li><a href="{{ route('help.faq') }}" target="_blank">Perguntas Frequentes (FAQ)</a></li>
        <li><a href="{{ route('help.support') }}" target="_blank">Falar com Suporte</a></li>
        <li><a href="{{ route('help.suggestion') }}" target="_blank">Sugerir uma Melhoria</a></li>
    </ul>

    <div class="help-button">
        ?
    </div>
</div>