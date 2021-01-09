import 'package:flutter/material.dart';
import 'package:ndia_app/screens/score_description/score_description.body.dart';

class ScoreDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Color(0xff1B233F),
        elevation: 0,
      ),
      body: ScoreDescriptionBody(),
    );
  }
}
