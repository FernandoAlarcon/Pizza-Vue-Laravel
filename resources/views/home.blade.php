@extends('layouts.app')

@section('content')
<div class="container">
    <div id="app">                    
        @if(Auth::user()->email_verified_at != "")
            @include('layouts.data')
        @else 
            @include('layouts.confirmacion')
        @endif 
    </div>
</div>
@endsection
