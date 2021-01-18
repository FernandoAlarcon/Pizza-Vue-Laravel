<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;

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
}
