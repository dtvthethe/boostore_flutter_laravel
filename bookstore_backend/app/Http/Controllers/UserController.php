<?php

namespace App\Http\Controllers;

use App\Http\Requests\User\LoginRequest;
use App\Http\Requests\User\RegisterRequest;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    public function register(RegisterRequest $request)
    {
        $user = $request->validated();
        $user['password'] = Hash::make($user['password']);
        $user = User::create($user);

        return response()->json([
            'status' => 200,
            'data' => $user->toArray(),
            'messages' => 'Create successs.',
        ]);
    }

    public function login(LoginRequest $request)
    {
        $data = $request->validated();
        $credential = [
            'phone' => $data['phone'],
            'password' => $data['password'],
        ];

        if (!Auth::attempt($credential)) {
            return response()->json([
                'status' => 401,
                'data' => [],
                'messages' => 'Login fail.',
            ]);
        }

        $user = User::where('phone', $request['phone'])->firstOrFail();
        $token = $user->createToken($data['device_name'])->plainTextToken;

        return response()->json([
            'status' => 200,
            'data' => [
                'access_token' => $token,
                'token_type' => 'Bearer',
                'display_name' => $user->display_name,
                'avatar' => $user->avatar,
            ],
            'messages' => 'Create successs.',
        ]);
    }

    public function me(){
        return response()->json([
            'status' => 200,
            'data' => Auth::user()->toArray(),
            'messages' => 'Me.',
        ]);
    }

    public function logout() {
        Auth::user()->tokens()->delete();

        return response()->json([
            'status' => 200,
            'data' => [],
            'messages' => 'Logout success.',
        ]); 
    }
}
