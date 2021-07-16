<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Picture extends Model
{
	use SoftDeletes;
	
	protected $fillable = [
		'hotel_id',
		'picture',
	];

    public function hotel()
    {
    	return $this->belongsTo(Hotel::class);
    }
}