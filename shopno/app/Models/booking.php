<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class booking extends Model
{
    use HasFactory;
    protected $table='bookings';
    protected $fillable=['customer_id','product_id','quantity','price','total_price'];
    protected $primaryKey='booking_id';
}
