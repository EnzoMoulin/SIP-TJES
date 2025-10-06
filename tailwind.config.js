import defaultTheme from 'tailwindcss/defaultTheme';
import forms from '@tailwindcss/forms';

/** @type {import('tailwindcss').Config} */
export default {
    content: [
        './vendor/laravel/framework/src/Illuminate/Pagination/resources/views/*.blade.php',
        './storage/framework/views/*.php',
        './resources/views/**/*.blade.php',
        // Add Filament paths
        './vendor/filament/**/*.blade.php',
        './vendor/filament-panels/**/*.blade.php',
        './vendor/filament-support/**/*.blade.php',
    ],

    theme: {
        extend: {
            fontFamily: {
                sans: ['Figtree', ...defaultTheme.fontFamily.sans],
            },
            // Add custom spacing for search bar alignment
            spacing: {
                'search-icon': '2.5rem', // Space for search icon
            }
        },
    },

    plugins: [forms],
};