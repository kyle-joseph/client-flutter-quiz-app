import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:ndia_app/services/questions.dart';
import 'package:http/http.dart' as http;

class AppState extends ChangeNotifier {
  Question _question = new Question();
  int _score = 0;
  int _totalScore = 0;
  String _category = '';
  String _description = '';
  bool loadedQuestions = false;
  List<dynamic> _questions = [];
  List<dynamic> _correctArray = [];
  List<dynamic> _answers = [];
  List<dynamic> _answerResult = [];

  List get questionList => _questions;

  List get answerList => _answers;

  List get answerResult => _answerResult;

  String get score => '$_score/$_totalScore';

  String get description => _description;

  int get scoreResult => _score;

  int get totalScore => _totalScore;

  void addAnswer(String answer) {
    _answers.add(answer);
    notifyListeners();
  }

  void setCategory(String category) async {
    _category = category;
    _questions.clear();
    _answers.clear();
    _answerResult.clear();
    _correctArray.clear();
    _score = 0;
    loadedQuestions = false;
    await fetchQuestions();
    notifyListeners();
  }

  fetchQuestions() async {
    _questions = await _question.getQuestions(_category);
    loadedQuestions = true;
    notifyListeners();
  }

  getCorrect() {
    _questions.forEach((item) {
      _correctArray.add(item.data()['correct']);
    });
  }

  // List getResult() {
  //   getCorrect();
  //   if (_questions.length == _answers.length) {
  //     for (int x = 0; x < _answers.length; x++) {
  //       if (_answers[x] == _questions[x].data()['correct']) {
  //         _answerResult.add('Correct');
  //         _score++;
  //       } else {
  //         _answerResult.add('Wrong');
  //       }
  //     }
  //     // print(_questions);
  //     calcScore();
  //     return _answerResult;
  //   }
  //   return [];
  // }

  Future getResult() async {
    getCorrect();
    // String url = 'https://tropicalfishdom.ga/api/calculate-score';
    String url = 'http://192.168.1.10/ndia-rest-api/public/api/calculate-score';
    var response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'answers': _answers,
        'correct': _correctArray,
      }),
    );
    if (response.statusCode == 200) {
      var res = jsonDecode(response.body);
      _answerResult = res['answerResult'];
      _score = res['score'];
      _totalScore = res['totalScore'];
      _description = res['description'];
    } else {
      throw Exception('Failed');
    }
    return _answerResult;
  }
}
