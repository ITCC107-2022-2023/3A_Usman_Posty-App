<?php

namespace App\Http\Controllers\API;

use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class HomeController extends Controller
{
    /**
     * Authorizes the users account in api.
     *
     * @param  \Illuminate\Http\Request  $request
     */
    public function auth(Request $request)
    {
        return $request->user();
    }
    public function index()
    {
        $users = User::all();
        return response()->json($users, 200);
    }
}
