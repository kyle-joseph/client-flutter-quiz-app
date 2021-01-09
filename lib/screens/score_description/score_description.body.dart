import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ScoreDescriptionBody extends StatelessWidget {
  Widget rowScore({String range, String description}) {
    return Container(
      padding: EdgeInsets.only(
        top: 20,
        bottom: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Container(
              child: BorderedText(
                strokeWidth: 3,
                strokeColor: Colors.white,
                child: Text(
                  range,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.nunito(
                    textStyle: TextStyle(
                      color: Color(0xffF1A368),
                      fontSize: 25,
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
                      color: Color(0xffF1A368),
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                    ),
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width - 50,
                margin: EdgeInsets.only(
                  top: 20,
                  bottom: 40,
                ),
                child: Text(
                  'DEPENDING ON YOUR SCORE:',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.concertOne(
                    textStyle: TextStyle(
                      color: Color(0xffDAD785),
                      fontSize: 35,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  bottom: 25,
                ),
                child: Column(
                  children: [
                    rowScore(range: '8 - 10', description: 'Knowledgeable'),
                    rowScore(range: '5 - 7', description: 'Average'),
                    rowScore(range: '1 - 4', description: 'Noob'),
                    rowScore(range: '0', description: 'Ogobs'),
                  ],
                ),
              ),
              Container(
                child: FlatButton(
                  child: Text(
                    'TAP TO CONTINUE',
                    style: GoogleFonts.nunito(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  onPressed: () => {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
