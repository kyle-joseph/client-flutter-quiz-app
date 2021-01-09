import 'package:flutter/material.dart';
import 'package:bordered_text/bordered_text.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeBody extends StatelessWidget {
  Widget borderedText(String msg,
      {double strokeWidth, Color strokeColor, Color color, double fontSize}) {
    return BorderedText(
      strokeColor: strokeColor,
      strokeWidth: strokeWidth,
      child: Text(
        msg,
        style: GoogleFonts.fredokaOne(
          textStyle: TextStyle(
            color: color,
            fontWeight: FontWeight.w900,
            fontSize: fontSize != null ? fontSize : 12.0,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Container(
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
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Container(
                        child: borderedText(
                          'NDIA',
                          fontSize: 80,
                          color: Color(0xff1B233F),
                          strokeColor: Color(0xffF1A368),
                          strokeWidth: 7.0,
                        ),
                      ),
                      Container(
                        child: Text(
                          'National Disaster Risk Information & Awareness',
                          style: GoogleFonts.nunito(
                            textStyle: TextStyle(
                              color: Color(0xffF1A368),
                              fontSize: 18,
                            ),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  child: borderedText(
                    'QUIZ',
                    fontSize: 80,
                    color: Color(0xff1B233F),
                    strokeColor: Color(0xffF1A368),
                    strokeWidth: 7.0,
                  ),
                ),
                Container(
                  width: 150,
                  height: 60,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    color: Color(0xffFAA800),
                    child: Text(
                      'START',
                      style: GoogleFonts.nunito(
                        textStyle: TextStyle(
                          color: Color(0xff1B233F),
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    onPressed: () async {
                      await Navigator.pushNamed(context, "/categories");
                    },
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
