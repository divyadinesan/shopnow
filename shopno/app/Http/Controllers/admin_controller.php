<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\Models\category;
use App\Models\product;
use Illuminate\Support\Facades\Validator;
///hello this message from api
class admin_controller extends Controller
{
     public function category_insert(Request $req)
    {
         $validator = Validator::make($req->all(),[
            'category_name'=>'required|min:2',
            'cat_image'=>'required',
        ]);

        if($validator->fails())
        {
            return response()->json([
                'status'=>'error','error'=>$validator->errors()
            ]);
        }
        $insert = new category;
        $insert->category_name = $req->post('category_name');
        if($req->hasfile('cat_image'))
               {
                   $file=$req->file('cat_image');
                   $extension=$file->getClientOriginalExtension();
                   $filename=time().'.'.$extension;
           $file->storeAs('public/category', $filename);
                
                   $insert->category_image=asset('storage/category/' . $filename);
                }

        $insert->save();

        return response()->json([
            'status'=>'success',
            'message'=>'successfully Inserted',
            'data'=>$insert
        ]);
    }

    public function category_fetch(Request $req)
    {
         $categories = category::all();

      
       return response()->json([
            'success' => true,
            'data'=>$categories
        ], 201);
    }
    public function product_insert(Request $req)
    {
    	 $validator = Validator::make($req->all(),[
    	 	'cat_id'=>'required',
            'name'=>'required|min:3',
            'price'=>'required',
            'description'=>'required',
            'prdct_image'=>'required',
           
        ]);

        if($validator->fails())
        {
            return response()->json([
                'status'=>'error','error'=>$validator->errors()
            ]);
        }
        $insert = new product;
        $insert->category_id = $req->post('cat_id');
        $insert->product_name = $req->post('name');
        $insert->product_price = $req->post('price');
        $insert->product_description = $req->post('description');
       

         if($req->hasfile('prdct_image'))
               {
                   $file=$req->file('prdct_image');
                   $extension=$file->getClientOriginalExtension();
                   $filename=time().'.'.$extension;
           $file->storeAs('public/product', $filename);
                
                   $insert->product_prdct_image=asset('storage/product/' . $filename);
                }

        $insert->save();

        return response()->json([
            'status'=>'success',
            'message'=>'successfully Inserted',
            'data'=>$insert
        ]);
    }
    public function product_fetch(Request $req)
    {
         $products=DB::table('products')->join('categories','categories.id','=','products.category_id')->get();

      
       return response()->json([
            'success' => true,
            'data' => $products
        ], 201);
    }
}
