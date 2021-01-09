import 'package:flutter/material.dart';
import 'package:ndia_app/screens/summary/summary.body.dart';

class Summary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        body: SummaryBody(),
      ),
    );
  }
}
