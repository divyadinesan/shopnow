<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->group(function () {
    

		Route::get('/customer_category','App\Http\Controllers\customercontroller@customer_category');

		Route::get('/customer_product/{id}','App\Http\Controllers\customercontroller@customer_product');

		Route::get('/product_details/{id}','App\Http\Controllers\customercontroller@product_details');

		Route::post('/booking_insert/{id}','App\Http\Controllers\customercontroller@booking_insert');

		Route::get('/my_booking','App\Http\Controllers\customercontroller@my_booking');

		Route::get('/customer_fetch','App\Http\Controllers\customercontroller@customer_fetch');
		
		Route::post('/customer_edit','App\Http\Controllers\customercontroller@customer_edit');


		Route::post('/customer_logout','App\Http\Controllers\customercontroller@customer_logout');

});

Route::post('/customer_register','App\Http\Controllers\customercontroller@customer_register');
Route::post('/customer_login','App\Http\Controllers\customercontroller@customer_login');
Route::post('/category_insert','App\Http\Controllers\admin_controller@category_insert');
Route::get('/category_fetch','App\Http\Controllers\admin_controller@category_fetch');
Route::post('/product_insert','App\Http\Controllers\admin_controller@product_insert');
Route::get('/product_fetch','App\Http\Controllers\admin_controller@product_fetch');