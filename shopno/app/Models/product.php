<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class product extends Model
{
    use HasFactory;
     protected $table='products';
    protected $fillable=['category_id','product_name','product_price','product_description','product_prdct_image'];
}
