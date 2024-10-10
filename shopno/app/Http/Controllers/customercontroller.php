<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\customer;
use App\Models\category;
use App\Models\product;
use App\Models\booking;
use Illuminate\Support\Facades\Validator;

class customercontroller extends Controller
{
    public function customer_register(Request $req)
    {
         $validator = Validator::make($req->all(),[
            'name'=>'required|min:3',
            'email'=>'required|email',
            'phone'=>'required|min:10',
            'password'=>'required|min:3',
            'address'=>'required|min:5',
        ]);

        if($validator->fails())
        {
            return response()->json([
                'status'=>'error','error'=>$validator->errors()
            ]);
        }
        $insert = new customer;
        $insert->c_name = $req->post('name');
        $insert->c_email = $req->post('email');
        $insert->c_phone = $req->post('phone');
        $insert->c_password = $req->post('password');
        $insert->c_address =$req->post('address');  
        $insert->save();

        return response()->json([
            'status'=>'success',
            'message'=>'Registered successfully',
            'data'=>$insert
        ]);
    }

    public function customer_login(Request $req)
    {
         $validator = Validator::make($req->all(),[
            'email'=>'required|email',
            'password'=>'required|min:3'
        ]);

        if($validator->fails())
        {
            return response()->json([
                'status'=>'error','error'=>$validator->errors()
            ]);
        }
        $cstmr=customer::where([['c_email',$req->post('email')],['c_password',$req->post('password')]])->first();

        if(!$cstmr)
        {
            return response()->json([
            'status'=>'error',
            'message'=>'Failer to Login...!',
            'data'=>$cstmr
             ]);
        }
      

    $token = $cstmr->createToken('jjj')->plainTextToken;
        
            return response()->json([
            'status'=>'success',
            'message'=>'Successfully Login',
            'data'=>$cstmr,
            'token'=>$token
             ]);
        

    }
    public function customer_fetch(Request $req)
    {
        $customer_id=auth()->User()->id;
       
        $cstmr=customer::where([['id',$customer_id]])->first();
        if($cstmr)
        {
             return response()->json([
            'status'=>'sucess',
            'message'=>'Customer Data..!',
            'data'=>$cstmr,
            
             ]);
        }

    }
     public function customer_edit(Request $req)
    {
        $customer_id=auth()->User()->id;
       
         $validator = Validator::make($req->all(),[
            'name'=>'required|min:3',
            'email'=>'required|email',
            'phone'=>'required|min:10',
            'password'=>'required|min:3',
            'address'=>'required|min:5',
        ]);

        if($validator->fails())
        {
            return response()->json([
                'status'=>'error','error'=>$validator->errors()
            ]);
        }
         $insert=customer::where([['id',$customer_id]])->first();
        $insert->c_name = $req->post('name');
        $insert->c_email = $req->post('email');
        $insert->c_phone = $req->post('phone');
        $insert->c_password = $req->post('password');
        $insert->c_address =$req->post('address');  
        $insert->save();

        return response()->json([
            'status' => 'success',
        'message' => 'Customer details updated successfully',
            'data'=>$insert
        ]);

    }


    public function customer_logout(Request $req)
    {
          $customer_id=auth()->User()->id;
       
        $cstmr=customer::where([['id',$customer_id]])->first();
        $cstmr->tokens()->delete();
        return response()->json([
            'status'=>'sucess',
            'message'=>'Logout',
            'data'=>$cstmr
            
             ]);

    }
   public function customer_category()
   {
     $categories = category::all();

      
       return response()->json([
            'success' => true,
            'data' => $categories
        ], 201);
   }

   public function customer_product(Request $req,$category_id)
   {
    $product = product::where([['category_id',$category_id]])->get();
     return response()->json([
            'success' => true,
            'data' => $product
        ], 201);

   }

   public function product_details(Request $req,$product_id)
   {
     $product = product::where([['id',$product_id]])->first();
     return response()->json([
            'success' => true,
            'data' => $product
        ], 201);
   }

   public function booking_insert(Request $req,$product_id)
    {
        $customer_id = auth()->user()->id;
        $product = product::where([['id',$product_id]])->first();
        $product_id=$product->id;
        $product_price=$product->product_price;
        $booking_insert = new booking;
        $booking_insert->customer_id=$customer_id;  
         $booking_insert->product_id=$product_id;
         $booking_insert->quantity=$req->post('quantity'); 
         $booking_insert->price=$product_price; 
         $booking_insert->total_price=$req->post('quantity')*$product_price;
         $booking_insert->save();
          return response()->json([
            'status'=>'success',
            'message'=>'successfully Inserted',
            'data'=>$booking_insert
        ]);

    
    }

    public function my_booking()
    {
        $customer_id = auth()->user()->id;
        $mybooking=booking::where([['customer_id',$customer_id]])->get();
         return response()->json([
            'status'=>'success',
            
            'data'=>$mybooking
        ]);
    }

  
}
