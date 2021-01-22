<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;

use App\Mail\DemoEmail;
use Illuminate\Support\Facades\Mail;
 

class PedidosController extends Controller
{
    public function DataPedidosAdmin(Request $request){
        $DataPedi   = trim($request->get('PedidoA'));

        if($DataPedi != ''){
            $pedidos = DB::table('pedidos AS P')
            ->join("users as U",         "U.id","=","P.id_cliente")
            ->join("ingredientes as I", "I.id_ingrediente","=","P.id_ingredientes")
            ->join("size_pizza  as SP", "SP.id_size","=","P.id_size")
            ->where('U.name','LIKE','%'.$DataPedi.'%')
            ->orWhere('SP.size','LIKE','%'.$DataPedi.'%')
            ->orWhere('I.ingrediente','LIKE','%'.$DataPedi.'%')
            ->orderBy('p.id_pedido', 'DESC')
            ->get();

        }else{
            $pedidos = DB::table('pedidos AS P')
            ->join("users as U",         "U.id","=","P.id_cliente")
            ->join("ingredientes as I", "I.id_ingrediente","=","P.id_ingredientes")
            ->join("size_pizza  as SP", "SP.id_size","=","P.id_size") 
            ->orderBy('p.id_pedido', 'DESC')
            ->get();
        }
        return $pedidos;
    }

    public function DataPedidosCliente(Request $request){
        $DataPedi   = trim($request->get('PedidoA'));
        $id_user    = Auth::user()->id;

        if($DataPedi != ''){
            $pedidos = DB::table('pedidos AS P')
            ->join("users as U",         "U.id","=","P.id_cliente")
            ->join("ingredientes as I", "I.id_ingrediente","=","P.id_ingredientes")
            ->join("size_pizza  as SP", "SP.id_size","=","P.id_size")
            ->where('P.id_cliente','=',$id_user) 
            ->where('U.name','LIKE','%'.$DataPedi.'%')
            ->orWhere('SP.size','LIKE','%'.$DataPedi.'%')
            ->orWhere('I.ingrediente','LIKE','%'.$DataPedi.'%')
            ->orderBy('p.id_pedido', 'DESC')
            ->get();

        }else{
            $pedidos = DB::table('pedidos AS P')
            ->join("users as U",         "U.id","=","P.id_cliente")
            ->join("ingredientes as I", "I.id_ingrediente","=","P.id_ingredientes")
            ->join("size_pizza  as SP", "SP.id_size","=","P.id_size") 
            ->where('P.id_cliente','=',$id_user)
            ->where('P.tipo_pedido','=','Cliente')
            ->orderBy('p.id_pedido', 'DESC')
            ->get();
        }
        return $pedidos;
    }

    public function EstadoPedidos(Request $request){
        
        $ID      = $request->get('IdPedido');
        $state   = $request->get('EstadoPedido');
        $correo  = $request->get('Correo');
        $nombre  = $request->get('Nombre');

        if($state == 'Eliminado'){
            $query = DB::delete('DELETE FROM pedidos WHERE id_pedido = ?', [$ID]);
        }else{            
            $query = DB::update('UPDATE pedidos SET Estado_Pedido = ? WHERE id_pedido = ?',[$state,$ID]);
        }

        
        if (!$query) {            
            $successfull = 'error';
        }else{
            if($state == 'Realizado'){
                $objDemo = new \stdClass(); 
                $objDemo->sender = 'Fernando Pizza';
                $objDemo->data   = 'Tu orden, ya esta terminada';
                $objDemo->receiver = $nombre;     
                Mail::to($correo)->send(new DemoEmail($objDemo));
            }
            $successfull = 'successfull';
        }/// FINAL IF
        
        //ingr
        

        return [  'Informacion' => [	'Info'  => 'Ayla Secura',
                                        'Event' => $successfull] ];
    }

    public function NuevoPedido(Request $request){

        // return [  'Informacion' => [	'Info'  =>  $request->all(),
        //                              'Event' => 'successfull' ] ];

        $id_ingrediente  = $request->input('Ingrediente');
        $id_size         = $request->input('SizePizza');
        $id_user         = $request->input('Usuario');
        $tipo            =  'Administrador';

        if(!$id_user){
            $id_user   = Auth::user()->id;
            $tipo    = 'Cliente';
        }

        $ingredientes = DB::table('ingredientes AS I')->where('I.id_ingrediente','=',$id_ingrediente)->get();
        $size_pizza   = DB::table('size_pizza   AS S')->where('S.id_size','=',$id_size)->get();
        $user         = DB::table('users        AS U')->where('U.id','=',$id_user)->get();
        
        $correo = $user[0]->email; 
        $ValorI = $ingredientes[0]->costo;
        $ValorS = $size_pizza[0]->precio_base;
        //echo $ValorS;  exit;

        $costo   = $ValorI + $ValorS; 
        
        $proceso = 'Preparacion';

        $query = DB::insert('INSERT INTO pedidos ( id_size, 
                                                   id_ingredientes,
                                                   id_cliente,
                                                   tipo_pedido,
                                                   precio,
                                                   Estado_Pedido ) VALUES (?, ?, ?, ?, ?, ?)',
                [$id_size,
                 $id_ingrediente,
                 $id_user,
                 $tipo,
                 $costo,
                 $proceso
                 ]);
        
        if (!$query) {
            $successfull = 'error';
        }else{ 

            $objDemo = new \stdClass(); 
            $objDemo->sender = 'Fernando Pizza';
            $objDemo->data   = 'Has realizado una orden por valor de 
                                $ '.number_format($costo).' , te informamos que ya se esta realizando';
            $objDemo->receiver = $user[0]->name;     
            Mail::to($correo)->send(new DemoEmail($objDemo));

            $successfull = 'successfull';
        }/// FINAL IF
        
        //ingr
        

        return [  'Informacion' => [	'Info'  => 'Kit Fisto',
                                        'Event' => $successfull] ];
    }


}
