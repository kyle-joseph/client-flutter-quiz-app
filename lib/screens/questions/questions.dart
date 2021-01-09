import 'package:flutter/material.dart';
import 'package:ndia_app/screens/questions/questions.body.dart';

class Questions extends StatefulWidget {
  @override
  _QuestionsState createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        body: QuestionsBody(),
      ),
    );
  }
}
