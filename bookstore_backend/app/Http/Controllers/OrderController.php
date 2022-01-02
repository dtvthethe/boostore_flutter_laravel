<?php

namespace App\Http\Controllers;

use App\Models\Order;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class OrderController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $user = Auth::user();
        $order = Order::with('orderDetails')->where('user_id', $user->id)->where('id', $request['order_id'])->first();
        return response()->json([
            'status' => 200,
            'data' => $order->toArray(),
            'messages' => 'Order details.',
        ]); 
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $user = Auth::user();
        $order = Order::firstOrCreate([
            'user_id' => $user->id,
            'status' => Order::ORDER_INIT,
        ]);
        $result = $order->orderDetails()->create([
            'product_id' => $request['product_id'],
        ]);

        return response()->json([
            'status' => 200,
            'data' => $result->toArray(),
            'messages' => 'Product added.',
        ]);
    }
}
