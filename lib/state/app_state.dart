import 'package:flutter/cupertino.dart';
import 'package:ndia_app/services/questions.dart';

class AppState extends ChangeNotifier {
  Question _question = new Question();
  int _score = 0;
  String _category = '';
  List<dynamic> _questions = [];
  List<dynamic> _answers = [];
  List<dynamic> _answerResult = [];

  List get questionList => _questions;

  List get answerList => _answers;

  List get answerResult => _answerResult;

  String get score => '$_score/${_questions.length}';

  int get scoreResult => _score;

  int get totalScore => _questions.length;

  void addAnswer(String answer) {
    print(answer + 'kyle');
    _answers.add(answer);
    notifyListeners();
  }

  void setCategory(String category) async {
    _category = category;
    _questions.clear();
    _answers.clear();
    _answerResult.clear();
    _score = 0;
    await fetchQuestions();
    notifyListeners();
    print(category);
  }

  fetchQuestions() async {
    _questions = await _question.getQuestions(_category);
    print(_questions);
  }

  List getResult() {
    if (_questions.length == _answers.length) {
      for (int x = 0; x < _answers.length; x++) {
        if (_answers[x] == _questions[x].data()['correct']) {
          _answerResult.add('Correct');
          _score++;
        } else {
          _answerResult.add('Wrong');
        }
      }
      print(_score);
      return _answerResult;
    }
    return [];
  }
}
