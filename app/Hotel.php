<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Hotel extends Model
{
    use SoftDeletes;

	protected $fillable = [
		'name',
		'category',
		'price'
	];

    public function picture()
    {
    	return $this->hasMany(Picture::class);
    }

    public function qualification()
    {
    	return $this->hasMany(Qualification::class);
    }
}