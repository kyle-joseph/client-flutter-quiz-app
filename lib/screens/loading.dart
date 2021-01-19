import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Container(
            child: SpinKitDoubleBounce(
              color: Color(0xff1B233F),
              size: 100.0,
            ),
          ),
        ),
      ),
    );
  }
}
