<?php

namespace App\Http\Controllers\API\Auth;

use App\Models\User;
use Illuminate\Http\Request;
use Tymon\JWTAuth\Facades\JWTAuth;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class RegisterController extends Controller
{
    /**
     * Register a User.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function register(Request $request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'name' => 'required',
                'email' => 'required|unique:users|email',
                'password' => 'required|min:8',
            ]);
            if ($validator->fails()) {
                $response = [
                    'success' => false,
                    'message' => $validator->errors(),
                ];
                return response()->json($response, 422);
            }
            $user = User::create([
                'name' => $request->input('name'),
                'email' => $request->input('email'),
                'password' => Hash::make($request->input('password')),
            ]);
            $userToken = JWTAuth::fromUser($user);
            $response = [
                'success' => true,
                'data' => [
                    'userToken' => $userToken,
                    'user_info' => $user,
                ],
                'message' => "User registered successfully"
            ];
            Auth::login($user);
            return response()->json($response, 201)->header('Authorization', 'Bearer ' . $userToken);
        } catch (\Exception $e) {
            $response = [
                'success' => false,
                'message' => $e->getMessage(),
            ];
            return response()->json($response, 500);
        }
    }
}
