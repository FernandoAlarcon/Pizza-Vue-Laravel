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

Route::get('/',  function () {
    return view('welcome');
});

//Route::get('/home_cosaca', [DataController::class, 'DataUsers' ]); NewIngrediente
Route::get('/DataUser', 'App\Http\Controllers\DataController@DataUsers');
Route::get('/NewIngrediente', 'App\Http\Controllers\DataController@NewIngrediente');


$DataController = 'App\Http\Controllers\DataController';

Route::get('profile', function () {
    // Only verified users may enter...
})->middleware('verified');

Auth::routes(['verify' => true]);
//$DataController.'@DataUsers',,[App\Http\Controllers\HomeController::class, 'index']
Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'] )->name('home');
