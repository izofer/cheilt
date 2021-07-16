<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\Hotel;
use App\Picture;
use App\Qualification;
use Storage;

class CheilController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $hotels = Hotel::with(['picture' => function($query){
                            $query->select(['hotel_id','picture']);
                        }])
                        ->get(['id','id as HotelID','name as HotelName','category as Categoria','price as Precio']);
        
        $hotels = $this->formatResponse($hotels);

        return response()->json(['data' => $hotels]);
    }

    public function filterHotel($category, $qualification = 2)
    {

        $hotels = Hotel::with(['picture'])
                    ->select('hotels.id','hotels.id as HotelID','hotels.name as HotelName','hotels.category as Categoria','hotels.price as Precio',DB::raw('ROUND(AVG(qualifications.score),1) as score'))
                    ->join('qualifications','hotels.id','=','qualifications.hotel_id')
                    ->where('hotels.category',$category)
                    ->where('score','>=',$qualification)
                    ->groupBy('hotels.id')
                    ->get();

        $hotels = $this->formatResponse($hotels);

        return response()->json(['data' => $hotels]);
    }

    public function filterHotelPrice($order)
    {
        $hotels = Hotel::orderBy('price',$order)->get(['id','id as HotelID','name as HotelName','category as Categoria','price as Precio']);

        $hotels = $this->formatResponse($hotels);

        return response()->json(['data' => $hotels]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $hotelId = Hotel::insertGetId([
            'name' => $request->name,
            'category' => $request->category,
            'price' => $request->price,
        ]);

        $pathName = str_replace(" ","",$request->name).rand(000,999);

        if($request->file('file1') != '')
        {
            $file = $request->file('file1');
            Picture::create([
                'hotel_id' => $hotelId,
                'picture'  => $file->store("hotels/$pathName",'public'),
            ]);
        }

        if($request->file('file2') != '')
        {
            $file = $request->file('file2');
            Picture::create([
                'hotel_id' => $hotelId,
                'picture'  => $file->store("hotels/$pathName",'public'),
            ]);
        }

        if($request->file('file3') != '')
        {
            $file = $request->file('file3');
            Picture::create([
                'hotel_id' => $hotelId,
                'picture'  => $file->store("hotels/$pathName",'public'),
            ]);
        }

        return response()->json(['data' => 'Hotel created successful']);
    }

    public function hotelScore(Request $request)
    {
        Qualification::create($request->all());

        return response()->json(['data' => 'Hotel qualified successful']);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $hotel = Hotel::with(['picture'])
                        ->where('id',$id)
                        ->get(['id','id as HotelID','name as HotelName','category as Categoria','price as Precio']);

        $hotel = $this->formatResponse($hotel);

        return response()->json(['data' => $hotel]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $hotel = Hotel::findOrFail($id);
        $hotel->fill($request->all())->save();

        return response()->json(['data' => 'Hotel has been edited']);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $hotel = Hotel::findOrFail($id);
        $hotel->delete();

        return response()->json(['data' => 'Hotel has been deleted']);
    }


    private function formatResponse($hotels)
    {
        $data = $hotels->map(function($item,$index){
            $pictures = [];
            foreach ($item->picture as $picture) 
            {
                $pictures[] = Storage::disk('public')->url($picture->picture);
            }
            
            return [
                'HotelID' => $item->HotelID,
                'HotelName' => $item->HotelName,
                'Categoria' => $item->Categoria,
                'Precio' => number_format($item->Precio,0,'.','.'),
                'Score' => $item->score,
                'Pictures' => $pictures
            ];
        });

        return $data;
    }
}