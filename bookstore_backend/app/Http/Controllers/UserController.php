<?php

namespace App\Http\Controllers;

use App\Http\Requests\User\RegisterRequest;
use Illuminate\Http\Resources\Json\JsonResource;

class UserController extends Controller
{
    public function register(RegisterRequest $request)
    {
        dd($request->all());
        return 'hihi';
    }
}
