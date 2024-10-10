<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
// use Illuminate\Foundation\Auth\User as Authenticatable;

class customer extends Model
{
	use HasApiTokens, HasFactory, Notifiable;
   
    protected $table='customers';
    protected $fillable=['c_name','c_email','c_phone','c_password','c_address'];
}
