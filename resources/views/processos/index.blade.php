@extends('layouts.app')

@section('content')
<div style="padding:20px;max-width:900px;margin:0 auto;font-family:system-ui,Segoe UI,Roboto,Helvetica,Arial,sans-serif;">
    <h2>Process Search</h2>

    <p>Route URL: <code>{{ route('processos.index') }}</code></p>

    <hr />

    {{-- Search input --}}
    <div style="margin-bottom:12px; display:flex; align-items:center;">
        <input id="search-q" type="text" value="{{ request('q') }}" placeholder="Type 253 or another substring" style="padding:8px;width:300px;margin-right:8px;">
        <button id="search-go" type="button" style="padding:8px 12px; cursor:pointer;">
            🔍
        </button>
    </div>

    <hr />

    {{-- Results table --}}
    @if($processos->count() > 0)
        <table style="width:100%;border-collapse:collapse;">
            <thead>
                <tr style="background:#f3f3f3;text-align:left;">
                    <th style="padding:8px;border-bottom:1px solid #ddd;">ID</th>
                    <th style="padding:8px;border-bottom:1px solid #ddd;">Número</th>
                    <th style="padding:8px;border-bottom:1px solid #ddd;">Status</th>
                </tr>
            </thead>
            <tbody>
                @foreach($processos as $p)
                    <tr class="hover:bg-gray-50">
                        <td style="padding:8px;border-bottom:1px solid #ddd;">{{ $p->id }}</td>
                        <td style="padding:8px;border-bottom:1px solid #ddd;word-break:break-all;">{{ $p->numero }}</td>
                        <td style="padding:8px;border-bottom:1px solid #ddd;">
                            {{ $p->statusprocesso ?? '-' }}
                        </td>
                    </tr>
                @endforeach
            </tbody>
        </table>

        {{-- Pagination --}}
        <div style="margin-top:12px;">
            {{ $processos->links() }}
        </div>
    @else
        <p>No processes found.</p>
    @endif
</div>

<script>
document.getElementById('search-go').addEventListener('click', function () {
    const q = document.getElementById('search-q').value || '';
    const url = new URL("{{ route('processos.index') }}", window.location.origin);
    if (q.trim() !== '') url.searchParams.set('q', q.trim());
    window.location.href = url.toString();
});

document.getElementById('search-q').addEventListener('keydown', function (e) {
    if (e.key === 'Enter') document.getElementById('search-go').click();
});
</script>
@endsection