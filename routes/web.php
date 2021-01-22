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
$DataController    = 'App\Http\Controllers\DataController';
$PedidosController = 'App\Http\Controllers\PedidosController';

Route::get('/DataUser', $DataController.'@DataUsers');
Route::get('/DataIngredientes', $DataController.'@DataIngrediente');
Route::get('/SizesPizza', $DataController.'@SizePizza');
Route::get('/ListIngredientes', $DataController.'@IngredientesList');
Route::get('/ListUsuarios', $DataController.'@ListaUsuarios');
Route::get('/DeleIngredientes', $DataController.'@DeleteIngredientes');


Route::get('/PedidosAdmin', $PedidosController.'@DataPedidosAdmin'); 
Route::get('/PedidosCliente', $PedidosController.'@DataPedidosCliente'); 

Route::get('/DataPizza', $DataController.'@DataPizza'); 
Route::get('/DeletePizza', $DataController.'@DeletePizza'); 

/// CANCELAR 
Route::get('/EstadoPedido', $PedidosController.'@EstadoPedidos'); 


Route::post('/NewIngrediente', $DataController.'@NewIngrediente');
Route::post('/NewPizza', $DataController.'@NuevaPizza');
Route::post('/NuevoPedido', $PedidosController.'@NuevoPedido');
//Route::get('/NuevoPedido', $PedidosController.'@NuevoPedido');



Route::get('profile', function () {
    // Only verified users may enter...
})->middleware('verified');

Auth::routes(['verify' => true]);
//$DataController.'@DataUsers',,[App\Http\Controllers\HomeController::class, 'index']
Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'] )->name('home');
