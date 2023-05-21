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

Route::get('/welcome', function () {
    $data = [
        'message' => 'Welcome to Posty App',
        'about' => 'A simple social media application using Flutter and PHP Laravel Framework.',
        'created_by' => 'Al-Fhaigar J. Usman',
        'technology_stacks' => [
            'frontend' => 'Flutter',
            'backend' => 'Laravel',
            'database' => 'MongoDB',
            'server' => 'Digital Ocean',
        ],
    ];
    return response()->json($data)->header('Content-Type', 'application/json');
});

Route::get('/', function () {
    return view('welcome');
});
