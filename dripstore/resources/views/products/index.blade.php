@extends('products.layout')

@section('content')
    <div class="row">
        <div class="col-lg-12 margin-tb">
        <div class="pull-left">
            <h2>Drip Store CMS Application</h2>
        </div>
        </div>
        <div class="pull-right">
            <a href="{{ route('products.create') }}" class="btn btn-success">Create New Products</a>
        </div>
    </div>
    @if ($message = Session::get('success'))
        <div class="alert alert-success">
            <p>{{ $message }}</p>
        </div>
    @endif
    <table class="table table-bordered">
        <tr>
            <th>No.</th>
            <th>Name</th>
            <th>Price</th>
            <th>Details</th>
            <th width="250px">Action</th>
        </tr>
        @foreach($products as $product)
        <tr>
            <td>{{ ++$i }}</td>
            <td>{{ $product-> strName}}</td>
            <td>{{ $product-> nPrice}}</td>
            <td>{{ $product-> strDesc}}</td>
            <td>
                <form action="{{ route('products.destroy', $product->id) }}" method="post">
                    <a href="{{ route('products.show', $product->id)}}" class="btn btn-info">Show</a>
                    <a href="{{ route('products.edit', $product->id)}}" class="btn btn-primary">Edit</a>

                    @csrf
                    @method('DELETE')

                    <button type="submit" class="btn btn-danger">Delete</button>
                </form>
            </td>
        </tr>
        @endforeach
    </table>
    {!! $products->links() !!}

    @endsection
