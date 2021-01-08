import 'package:flutter/material.dart';
import 'package:ndia_app/screens/welcome/welcome.body.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        body: WelcomeBody(),
      ),
    );
  }
}
