<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return response()->json([
        'message' => 'Welcome to Posty App',
        'author' => 'Al-Fhaigar J. Usman'
    ])->withHeaders([
        'Content-Type' => 'application/json',
    ])->view('welcome');
});
