import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ndia_app/screens/loading.dart';
import 'package:ndia_app/services/connection.dart';
import 'package:ndia_app/state/app_state.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

class QuestionsBody extends StatefulWidget {
  @override
  _QuestionsBodyState createState() => _QuestionsBodyState();
}

class _QuestionsBodyState extends State<QuestionsBody> {
  Connection conn = new Connection();
  List<bool> active = [false, false, false, false];
  List _questionList = [];
  String _answer = '';
  int _counter = 0;
  bool oneTap = true;
  int correctIndex = -1;

  Widget circularNumber({String title}) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 25,
      ),
      child: Material(
        color: Color(0xff3B4768),
        shape: CircleBorder(),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            height: 50,
            width: 50,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: GoogleFonts.concertOne(
                fontSize: 40,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget questionContainer() {
    return Container(
      margin: EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: 20,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.5),
            ),
            child: Container(
              child: Text(
                _questionList[_counter].data()['question'],
                style: GoogleFonts.nunito(
                  color: Color(0xff1B233F),
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget choiceButton(int index, String choice) {
    Color _activeColor;

    if (choice == _questionList[_counter].data()['correct']) {
      _activeColor = Color(0xff2BB544);
      correctIndex = index;
    } else {
      _activeColor = Color(0xffE30037);
    }

    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.only(
        bottom: 15,
      ),
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: active[index] ? _activeColor : Color(0xff3B4768),
        child: Text(
          choice,
          textAlign: TextAlign.center,
          style: GoogleFonts.nunito(
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        onPressed: () {
          if (oneTap) {
            setState(() {
              active[index] = true;
              active[correctIndex] = true;
              _answer = choice;
              oneTap = false;
            });
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    dynamic appstate = Provider.of<AppState>(context);
    _questionList = appstate.questionList;

    return !appstate.loadedQuestions
        ? Loading()
        : Container(
            padding: EdgeInsets.only(top: 40),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/background.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    circularNumber(title: '${_counter + 1}'),
                    questionContainer(),
                    Container(
                      margin: EdgeInsets.only(
                        bottom: 20,
                      ),
                      child: Column(
                        children: [
                          choiceButton(0, _questionList[_counter].data()['a']),
                          choiceButton(1, _questionList[_counter].data()['b']),
                          choiceButton(2, _questionList[_counter].data()['c']),
                          choiceButton(3, _questionList[_counter].data()['d']),
                        ],
                      ),
                    ),
                    Container(
                      child: FlatButton(
                        child: Text(
                          'CONTINUE',
                          style: GoogleFonts.nunito(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        onPressed: () async {
                          if (!oneTap) {
                            if (_counter < _questionList.length - 1) {
                              setState(() {
                                oneTap = true;
                                _counter++;
                                for (int x = 0; x < active.length; x++) {
                                  active[x] = false;
                                }
                              });
                            } else {
                              bool connection = await conn.checkConnection();
                              if (connection) {
                                Navigator.popAndPushNamed(context, '/summary');
                              } else {
                                Toast.show("No Internet Connection", context,
                                    duration: 5, gravity: Toast.BOTTOM);
                              }
                            }
                            appstate.addAnswer(_answer);
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
