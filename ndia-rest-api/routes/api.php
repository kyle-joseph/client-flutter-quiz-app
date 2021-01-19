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

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('/calculate-score', function (Request $request){
    $answers = $request->answers;
    $correct = $request->correct;
    $answerResult = array();
    $score = 0;
    $totalScore = sizeof($correct);
    $description = '';
    
    
    for ($x = 0; $x < sizeof($correct); $x++) {
        if($correct[$x] == $answers[$x]){
            array_push($answerResult, "Correct");
            $score++;
        }
        else{
            array_push($answerResult, "Wrong");
        }
        
    }

    $percentage = intval(($score / $totalScore) * 100);

    if ($percentage <= 100 && $percentage >= 80) {
        $description = 'Knowledgeable';
    } elseif ($percentage <= 70 && $percentage >= 50) {
        $description = 'Average';
    } elseif ($percentage <= 40 && $percentage >= 10) {
        $description = 'Noob';
    } else {
        $description = 'Ogobs';
    }

    return response()->json([
        'answerResult' => $answerResult,
        'score' => $score,
        'totalScore' => $totalScore,
        'description' => $description
    ]);
});
