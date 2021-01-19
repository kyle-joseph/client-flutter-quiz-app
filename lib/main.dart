import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ndia_app/screens/categories/categories.dart';
import 'package:ndia_app/screens/loading.dart';
import 'package:ndia_app/screens/questions/questions.dart';
import 'package:ndia_app/screens/result/result.dart';
import 'package:ndia_app/screens/score_description/score_description.dart';
import 'package:ndia_app/screens/summary/summary.dart';
import 'package:ndia_app/screens/welcome/welcome.dart';
import 'package:ndia_app/state/app_state.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Create the initialization Future outside of `build`:
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return SomethingWentWrong();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return Main();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Loading();
      },
    );
  }
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppState(),
      child: MaterialApp(
        title: 'NDIA Quiz App',
        initialRoute: '/home',
        routes: {
          '/home': (context) => Welcome(),
          '/categories': (context) => Categories(),
          '/scoredesc': (context) => ScoreDescription(),
          '/question': (context) => Questions(),
          '/summary': (context) => Summary(),
          '/result': (context) => Result(),
        },
      ),
    );
  }
}

class SomethingWentWrong extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Image.asset('assets/images/something.png'),
                ),
                Container(
                  child: Text(
                    'Something went wrong...',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.nunito(
                      textStyle: TextStyle(
                        color: Color(0xffE30037),
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
