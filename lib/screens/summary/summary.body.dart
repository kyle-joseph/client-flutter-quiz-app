import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ndia_app/main.dart';
import 'package:ndia_app/screens/loading.dart';
import 'package:ndia_app/state/app_state.dart';
import 'package:provider/provider.dart';

class SummaryBody extends StatefulWidget {
  @override
  _SummaryBodyState createState() => _SummaryBodyState();
}

class _SummaryBodyState extends State<SummaryBody> {
  List _answerSummary = [];
  getSummary() async {
    _answerSummary = await Provider.of<AppState>(context).getResult();
    return _answerSummary;
  }

  Widget rowScore({String range, String description}) {
    return Container(
      padding: EdgeInsets.only(
        top: 5,
        bottom: 5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Container(
              child: BorderedText(
                strokeWidth: 3,
                strokeColor: Color(0xff1B233F),
                child: Text(
                  range,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.nunito(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              child: BorderedText(
                strokeWidth: 3,
                strokeColor: Colors.white,
                child: Text(
                  description,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.nunito(
                    textStyle: TextStyle(
                      color: description == 'Correct'
                          ? Color(0xff2BB544)
                          : Color(0xffE30037),
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) => FutureBuilder(
        future: getSummary(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
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
                  padding: EdgeInsets.symmetric(
                    horizontal: 40,
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 50,
                        ),
                        margin: EdgeInsets.only(
                          top: 25,
                          bottom: 30,
                        ),
                        child: Text(
                          'SUMMARY OF SCORES',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.concertOne(
                            textStyle: TextStyle(
                              color: Color(0xffDAD785),
                              fontSize: 35,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          bottom: 20,
                        ),
                        child: Column(
                          children:
                              List.generate(_answerSummary.length, (index) {
                            return rowScore(
                                range: '${index + 1}',
                                description: _answerSummary[index]);
                          }),
                        ),
                      ),
                      Container(
                        child: FlatButton(
                          child: Text(
                            'CONTINUE',
                            style: GoogleFonts.nunito(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          onPressed: () {
                            Navigator.popAndPushNamed(context, '/result');
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Loading();
          }
        },
      );
}
