import 'package:flutter/material.dart';
import 'package:ndia_app/screens/result/result.body.dart';

class Result extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        body: ResultBody(),
      ),
    );
  }
}
