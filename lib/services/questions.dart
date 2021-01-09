import 'package:cloud_firestore/cloud_firestore.dart';

class Question {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference questions =
      FirebaseFirestore.instance.collection('questions');

  Future getQuestions(category) async {
    List<dynamic> questionList = [];

    await questions.where('category', isEqualTo: category).get().then((res) {
      questionList = res.docs;
    }).catchError((error) => print(error));
    questionList.shuffle();

    return questionList;
  }
}
