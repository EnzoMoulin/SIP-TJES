{{-- resources/views/components/caixote.blade.php --}}

@props([
    'title' => null, // Defines an optional 'title' attribute
])

{{-- 
  This is the main container for your box. 
  The 'attributes->merge' part allows you to add extra CSS classes when you call the component.
--}}
<div {{ $attributes->merge(['class' => 'bg-white text-slate-800 rounded-xl shadow-lg border border-slate-200']) }}>
    
    {{-- The header section will only show up if you provide a title --}}
    @if ($title)
    <div class="px-6 py-4 border-b border-slate-200">
        <h3 class="text-lg font-bold text-slate-900">
            {{ $title }}
        </h3>
    </div>
    @endif

    {{-- The main content area. The '$slot' is where your content will go. --}}
    <div class="p-6">
        {{ $slot }}
    </div>

</div>