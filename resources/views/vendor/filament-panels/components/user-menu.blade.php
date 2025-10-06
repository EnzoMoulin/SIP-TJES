@php
    $user = filament()->auth()->user();
    $profileUrl = filament()->getProfileUrl();

    // Iniciais do usuário
    $nameParts = explode(' ', $user->name ?? '');
    $initials = strtoupper(substr($nameParts[0] ?? '', 0, 1));
    if (isset($nameParts[1])) {
        $initials .= strtoupper(substr($nameParts[1], 0, 1));
    }
@endphp

<style>
    /* Legibilidade do dropdown */
    .fi-user-menu .fi-dropdown-panel,
    .fi-user-menu .fi-dropdown-panel * {
        color: #111827 !important; /* gray-900 */
    }
    .dark .fi-user-menu .fi-dropdown-panel,
    .dark .fi-user-menu .fi-dropdown-panel * {
        color: #E5E7EB !important; /* gray-200 */
    }

    /* Dropdown base e transição suave */
    .fi-dropdown-panel {
        min-width: 12rem;
        border-radius: 0.75rem;
        transition: opacity 0.2s ease, transform 0.2s ease, box-shadow 0.2s ease;
        will-change: transform, opacity, box-shadow;
    }

    /* Hover de flutuação do dropdown (efeito sutil) */
    .fi-dropdown-panel:hover {
        transform: translateY(-2px);
        box-shadow:
            0 6px 18px rgba(0,0,0,0.06),
            0 14px 36px rgba(0,0,0,0.08);
    }

    /* Itens do dropdown - layout consistente */
    .fi-dropdown-panel .dropdown-item {
        display: flex;
        align-items: center;
        gap: 0.75rem;
        padding: 0.75rem 1rem;
        border-radius: 0.5rem;
        font-weight: 500;
        transition: background-color 0.15s ease, color 0.15s ease;
        white-space: nowrap;
    }

    /* Força que ícones não encolham */
    .fi-dropdown-panel .dropdown-item > svg {
        flex-shrink: 0;
    }

    /* Hover igual para links e botões (garante consistência mesmo com estilos globais) */
    .fi-dropdown-panel .dropdown-item:hover,
    .fi-dropdown-panel .dropdown-item:focus {
        background-color: #F3F4F6 !important;
        color: #111827 !important;
    }
    .dark .fi-dropdown-panel .dropdown-item:hover,
    .dark .fi-dropdown-panel .dropdown-item:focus {
        background-color: #374151 !important;
        color: #E5E7EB !important;
    }

    /* Caso algum estilo global trate botão diferente, normalize aqui */
    .fi-dropdown-panel form.logout-form {
        margin: 0;
    }
    .fi-dropdown-panel form.logout-form .dropdown-item {
        background: transparent;
        border: none;
        cursor: pointer;
        width: 100%;
        text-align: left;
        padding-left: 1rem; /* mantém alinhamento consistente */
        padding-right: 1rem;
    }

    /* Garante que o texto do item ocupe o espaço restante e alinhe corretamente */
    .fi-dropdown-panel .dropdown-item .item-text {
        flex: 1 1 auto;
    }
</style>

<div
    x-data="{ open: false }"
    class="fi-user-menu relative"
    @keydown.escape.window="open = false"
    @click.away="open = false"
>
    {{-- Botão do avatar --}}
    <button
        @click="open = !open"
        class="flex items-center justify-center rounded-full focus:outline-none focus:ring-2 focus:ring-primary-500 focus:ring-offset-2"
        aria-label="User menu"
        :aria-expanded="open.toString()"
    >
        <span
            class="flex items-center justify-center rounded-full"
            style="background: #F0A0B8; padding: 4px; border-radius: 9999px;"
        >
            <span
                class="flex items-center justify-center rounded-full text-white font-semibold select-none"
                style="background: #F6ADCD; width: 3rem; height: 3rem; font-family: 'Inter', sans-serif; font-size: calc(0.5rem + 1vw);"
            >
                {{ $initials }}
            </span>
        </span>
    </button>

    {{-- Dropdown --}}
    <div
        x-show="open"
        x-transition:enter="transition ease-out duration-200"
        x-transition:enter-start="opacity-0 translate-y-1"
        x-transition:enter-end="opacity-100 translate-y-0"
        x-transition:leave="transition ease-in duration-150"
        x-transition:leave-start="opacity-100 translate-y-0"
        x-transition:leave-end="opacity-0 translate-y-1"
        style="display: none;"
        class="fi-dropdown-panel absolute right-0 mt-2 rounded-xl bg-white dark:bg-gray-800 ring-1 ring-black ring-opacity-5 focus:outline-none overflow-hidden z-50"
        role="menu"
    >
        <div>
            @if ($profileUrl)
                <a href="{{ $profileUrl }}" role="menuitem" class="dropdown-item">
                    {{-- Ícone perfil (solid) --}}
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-gray-500 dark:text-gray-300" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                        <path d="M10 10a4 4 0 100-8 4 4 0 000 8z" />
                        <path fill-rule="evenodd" d="M2 18a8 8 0 1116 0H2z" clip-rule="evenodd" />
                    </svg>

                    <span class="item-text">Perfil</span>
                </a>
            @endif

            <form method="POST" action="{{ filament()->getLogoutUrl() }}" class="logout-form" role="none">
                @csrf
                <button
                    type="submit"
                    role="menuitem"
                    class="dropdown-item"
                >
                    {{-- Ícone sair (corrigido) --}}
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-gray-500 dark:text-gray-300" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2" aria-hidden="true">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1" />
                    </svg>

                    <span class="item-text">Sair</span>
                </button>
            </form>
        </div>
    </div>
</div>