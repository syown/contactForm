<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

//入力ページ
// Route::get('/contact', 'ContactController@index');
Route::get('/contact', 'App\Http\Controllers\ContactController@index');

//確認ページ
// Route::post('/contact/confirm', 'ContactController@confirm')->name('contact.confirm');
Route::get('/contact/confirm', 'App\Http\Controllers\ContactController@confirm')->name('contact.confirm');

//送信完了ページ
// Route::post('/contact/thanks', 'ContactController@send')->name('contact.send');
Route::get('/contact/thanks', 'App\Http\Controllers\ContactController@send')->name('contact.send');