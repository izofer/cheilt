<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Qualification extends Model
{
	use SoftDeletes;

	protected $fillable = [
		'hotel_id',
		'score',
		'commentary'
	];
	
    public function hotel()
    {
    	return $this->belongsTo(Hotel::class);
    }
}
