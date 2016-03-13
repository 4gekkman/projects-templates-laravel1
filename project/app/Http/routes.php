<?php

/*
|--------------------------------------------------------------------------
| Routes File
|--------------------------------------------------------------------------
|
| Here is where you will register all of the routes in an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the controller to call when that URI is requested.
|
*/

Route::get('/', function () {

    if(!Cache::has('counter'))
      Cache::forever('counter', 1);
    else
      Cache::forever('counter', +Cache::get('counter')+1);

    $counter = DB::table('test')->where('id', 1)->pluck('counter')[0];
    $counter = +$counter + 1;
    DB::table('test')
        ->where('id', 1)
        ->update(['counter' => $counter]);

    return view('my', ['test'=>$counter, 'cache'=>Cache::get('counter')]);

});

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| This route group applies the "web" middleware group to every route
| it contains. The "web" middleware group is defined in your HTTP
| kernel and includes session state, CSRF protection, and more.
|
*/

Route::group(['middleware' => ['web']], function () {
    //
});
