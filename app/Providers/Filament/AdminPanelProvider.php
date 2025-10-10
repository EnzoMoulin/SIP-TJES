<?php

namespace App\Providers\Filament;

use App\Filament\Resources\Processos\PeticaoInicial\MinutarDecisaoInicialUrgenciaResource;
use App\Filament\Resources\CadastroModeloResource;
// Adicione os outros Resources de Cadastro aqui (Processo e Orgao)
// use App\Filament\Resources\CadastroProcessoResource;
// use App\Filament\Resources\CadastroOrgaoResource;
use App\Livewire\CustomGlobalSearch;
use App\Filament\Pages\Relatorio; // Assumido: Se for uma página customizada
use Filament\Http\Middleware\Authenticate;
use Filament\Http\Middleware\AuthenticateSession;
use Filament\Http\Middleware\DisableBladeIconComponents;
use Filament\Http\Middleware\DispatchServingFilamentEvent;
use Filament\Navigation\NavigationGroup;
use Filament\Pages;
use Filament\Panel;
use Filament\PanelProvider;
use Filament\Support\Colors\Color;
use Filament\Support\Enums\MaxWidth;
use Filament\View\PanelsRenderHook;
use Illuminate\Contracts\View\View;
use Illuminate\Cookie\Middleware\AddQueuedCookiesToResponse;
use Illuminate\Cookie\Middleware\EncryptCookies;
use Illuminate\Foundation\Http\Middleware\VerifyCsrfToken;
use Illuminate\Routing\Middleware\SubstituteBindings;
use Illuminate\Session\Middleware\StartSession;
use Illuminate\View\Middleware\ShareErrorsFromSession;
use Illuminate\Support\Facades\Blade;

class AdminPanelProvider extends PanelProvider
{
    public function panel(Panel $panel): Panel
    {
        return $panel
            ->default()
            ->id('admin')
            ->path('admin')
            ->brandLogo(asset('images/tjes22222.png'))
            ->brandLogoHeight('4.5rem')

            ->viteTheme('resources/css/filament/admin/theme.css')
            ->login()
            ->globalSearch(CustomGlobalSearch::class)
            ->registration()
            ->profile()
            ->userMenuItems([
                'profile' => \Filament\Navigation\MenuItem::make()->label('Profile'),
                'logout'  => \Filament\Navigation\MenuItem::make()->label('Sign out'),
            ])
            ->darkMode(false)
            ->colors([
                'danger'  => Color::Red,
                'gray'    => Color::Zinc,
                'info'    => Color::Blue,
                'primary' => Color::Amber,
                'success' => Color::Green,
                'warning' => Color::Yellow,
            ])
            ->navigationGroups([
                NavigationGroup::make('Tarefa: Petição Inicial'),
                NavigationGroup::make('Classe: Busca e Apreensão'),
                NavigationGroup::make('Etiqueta: Impugnação à Penhora'),
                NavigationGroup::make('Extra: Atos Dinâmicos'),
                NavigationGroup::make('Cadastros Variados'),
            ])
            ->navigationItems([

            ])
            ->sidebarCollapsibleOnDesktop()
            ->discoverResources(in: app_path('Filament/Resources'), for: 'App\\Filament\\Resources')
            ->discoverPages(in: app_path('Filament/Pages'), for: 'App\\Filament\\Pages')
            ->discoverWidgets(in: app_path('Filament/Widgets'), for: 'App\\Filament\\Widgets')
            ->discoverClusters(in: app_path('Filament/Clusters'), for: 'App\\Filament\\Clusters')
            ->maxContentWidth(MaxWidth::Full)
            ->pages([
                Pages\Dashboard::class,
                // Relatorio::class, // Se for uma Page
            ])
            ->resources([
                MinutarDecisaoInicialUrgenciaResource::class,
                CadastroModeloResource::class,
                // Outros Resources...
            ])
            ->widgets([])
            ->middleware([
                EncryptCookies::class,
                AddQueuedCookiesToResponse::class,
                StartSession::class,
                AuthenticateSession::class,
                ShareErrorsFromSession::class,
                VerifyCsrfToken::class,
                SubstituteBindings::class,
                DisableBladeIconComponents::class,
                DispatchServingFilamentEvent::class,
            ])
            ->authMiddleware([
                Authenticate::class,
            ])
            ->spa()
            ->renderHook(
                PanelsRenderHook::HEAD_END,
                fn (): string => Blade::render('<style>
                    /* CUSTOM FIX: Move logo up and center it vertically within the header space */
                    .fi-sidebar .fi-sidebar-brand {
                        padding-top: 1rem !important; /* Add top padding to push the logo down slightly */
                        padding-bottom: 0.5rem !important; /* Reduce bottom padding to move the overall block up */
                        align-items: center !important; /* Ensure vertical alignment is centered if container uses flex */
                    }
                        
                    
                    /* Ensures image maintains its aspect ratio */
                    .fi-brand-logo {
                        width: auto !important; 
                        max-height: 100% !important; 
                        
                    }
                    /* small helpers and custom components styles */
                    .civil-criminal-panel-container {
                        position: fixed !important;
                        bottom: 2.03rem !important;
                        right: 8rem !important;
                        z-index: 100 !important;
                    }
                    .btn-competencia {
                        flex-grow: 1;
                        padding: 0.5rem 1rem;
                        border: 1px solid #D1D5DB;
                        border-radius: 0.375rem;
                        background-color: #FFFFFF;
                        color: #374151;
                        font-weight: 500;
                        transition: all 0.2s ease-in-out;
                        cursor: pointer;
                    }
                    .btn-competencia:hover {
                        border-color: #9CA3AF;
                    }
                    .btn-competencia.selected {
                        background-color: #FCE7F3;
                        color: #9D174D;
                        border-color: #F9A8D4;
                        font-weight: 600;
                        box-shadow: 0 1px 2px 0 rgb(0 0 0 / 0.05);
                    }
                </style>')
            )
            ->renderHook(
                PanelsRenderHook::BODY_END,
                fn (): View => view('components.floating-help-button')
            )
            ->renderHook(
                PanelsRenderHook::BODY_END,
                fn (): View => view('components.civil-criminal-panel')
            );
    }
}