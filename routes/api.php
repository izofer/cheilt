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

// Route::middleware('auth:api')->get('/user', function (Request $request) {
//     return $request->user();
// });

Route::apiResource('/hotels','CheilController');
Route::get('/filter-hotel/{category}/{qualification}','CheilController@filterHotel')->name('filterHotel');
Route::get('/filter-hotel-price/{order}','CheilController@filterHotelPrice')->name('filterHotelPrice');
Route::post('/hotel-score','CheilController@hotelScore')->name('hotelScore');