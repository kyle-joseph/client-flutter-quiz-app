import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SummaryBody extends StatelessWidget {
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
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: GoogleFonts.nunito(
                  textStyle: TextStyle(
                    color: Color(0xff75E48D),
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
                  children: [
                    rowScore(range: '1', description: 'Correct'),
                    rowScore(range: '2', description: 'Correct'),
                    rowScore(range: '3', description: 'Correct'),
                    rowScore(range: '4', description: 'Wrong'),
                    rowScore(range: '5', description: 'Wrong'),
                    rowScore(range: '6', description: 'Correct'),
                    rowScore(range: '7', description: 'Correct'),
                    rowScore(range: '8', description: 'Correct'),
                    rowScore(range: '9', description: 'Wrong'),
                    rowScore(range: '10', description: 'Wrong'),
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
  }
}
