<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\HomeController;
use App\Http\Controllers\API\PostController;
use App\Http\Controllers\API\Auth\LoginController;
use App\Http\Controllers\API\Auth\LogoutController;
use App\Http\Controllers\API\Auth\RegisterController;

/*
|--------------------------------------------------------------------------
| API Routes for User Authentication
|--------------------------------------------------------------------------
*/

Route::controller(RegisterController::class)->group(function () {
    Route::post('/register', 'register');
});
Route::controller(LoginController::class)->group(function () {
    Route::post('/login', 'login');
});
/*
|--------------------------------------------------------------------------
| Guards the API Routes for User Authentication
|--------------------------------------------------------------------------
*/
Route::middleware('auth:user-api')->group(function () {
    Route::controller(HomeController::class)->group(function () {
        Route::get('/user', 'auth')->name('login');
    });
    Route::controller(PostController::class)->group(function () {
        Route::get('/users/posts', 'index');
        Route::post('/users/posts', 'store');
        Route::put('/users/posts/{id}', 'update');
        Route::delete('/users/posts/{id}', 'destroy');
    });
    Route::controller(LogoutController::class)->group(function () {
        Route::post('/logout', 'logout');
    });
});
Route::controller(HomeController::class)->group(function () {
    Route::get('/getusers', 'index');
});
