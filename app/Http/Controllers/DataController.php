<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;

use Faker\Generator;
use App\Models\ingredientes;


class DataController extends Controller
{
    public function DataUsers(){
        $data_user = Auth::user();
        $id_user   = Auth::user()->id;

        $rolls  = DB::table('roll_user AS RS')
                    ->join("roles as R", "R.id_roll","=","RS.id_roll")
                    ->where('RS.id_user',"=",$id_user)
                    ->get();
        
        $data_user = json_encode($data_user, JSON_UNESCAPED_UNICODE);
        //$rolls     = json_encode($rolls, JSON_UNESCAPED_UNICODE);
 
        
        return [
            'DataUser' => $data_user,
            'Roll'     => $rolls
        ];
    }

    public function NewIngrediente(Request $request){
        
        $Costo  = trim($request->input('costo'));
        $Foto   = trim($request->input('foto'));
        $Nombre = trim($request->input('ingrediente')); 

        $query = DB::insert('INSERT INTO ingredientes (costo, ingrediente, foto) VALUES (?, ?, ?)',
                [$Costo,
                 $Nombre,
                 $Foto
                 ]);

        if (!$query) {
            $successfull = 'error';
        }else{
            $successfull = 'successfull';
        }/// FINAL IF

        //ingredientes::create($request->all());
        return [  'Informacion' => [	'Info' => 'Kit Fisto',
                                        'Event' => $successfull ] ];
    }
    
   

    public function DataIngrediente( Request $request ){
        $DataIng      = $request->get('DataIng');

        if($DataIng != ''){
            $ingredientes = DB::table('ingredientes AS I')
            ->where('I.costo','LIKE','%'.$DataIng.'%')
            ->orWhere('I.ingrediente','LIKE','%'.$DataIng.'%')
            ->get();

        }else{
            $ingredientes = DB::table('ingredientes')->get();
        }
        return $ingredientes;
    }

    public function SizePizza(){
        $size_pizza = DB::table('size_pizza')->get();
        //$size_pizza = DB::select(DB::raw("SELECT * FROM size_pizza"));
        return $size_pizza; //json_encode($size_pizza);
    }

    public function IngredientesList(){ 
        $ingredientes = DB::table('ingredientes')->get();
        //$ingredientes = DB::select(DB::raw("SELECT * FROM ingredientes"));
        return $ingredientes;// json_encode($ingredientes);
    }

    public function ListaUsuarios(){ 
        //$ingredientes = DB::select(DB::raw(" SELECT * FROM ingredientes WHERE  "));
        $Usuarios = DB::table('users AS U')
                    ->join('roll_user AS RU','U.id','=','RU.id_user')
                    ->Where('RU.id_roll','=','2')
                    ->get();
        
        return $Usuarios;
    }

    public function DeleteIngredientes(Request $request){

        $ID = $request->get('Id_Ing'); 
        $delete = DB::delete('DELETE FROM ingredientes WHERE id_ingrediente  = ? ', [$ID]);   
        return;
    }
    

    //////////////////PIZZAS /////////////

    public function DataPizza( Request $request ){
        $DataIng      = $request->get('DataIng');

        if($DataIng != ''){
            $size_pizza = DB::table('size_pizza AS I')
            ->where('I.precio_base','LIKE','%'.$DataIng.'%')
            ->orWhere('I.size','LIKE','%'.$DataIng.'%')
            ->get();

        }else{
            $size_pizza = DB::table('size_pizza')->get();
        }
        return $size_pizza;
    }

    public function DeletePizza(Request $request){

        $ID = $request->get('Id_Ing'); 
        $delete = DB::delete('DELETE FROM size_pizza WHERE id_size  = ? ', [$ID]);   
        return;
    }

    public function NuevaPizza(Request $request){
        
        $Costo  = trim($request->input('costo')); 
        $Nombre = trim($request->input('Nombre')); 

        $query = DB::insert('INSERT INTO size_pizza (precio_base, size) VALUES (?, ?)',
                [$Costo,
                 $Nombre
                 ]);

        if (!$query) {
            $successfull = 'error';
        }else{
            $successfull = 'successfull';
        }/// FINAL IF

        //ingredientes::create($request->all());
        return [  'Informacion' => [	'Info' => 'Kit Fisto',
                                        'Event' => $successfull ] ];
    }

}
