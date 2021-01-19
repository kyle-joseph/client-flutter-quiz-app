import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ndia_app/state/app_state.dart';
import 'package:provider/provider.dart';

class ResultBody extends StatelessWidget {
  // String scoreDescription(int score, int total) {
  //   dynamic percentage = (score / total) * 100;
  //   percentage = percentage.toInt();

  //   if (percentage <= 100 && percentage >= 80) {
  //     return 'Knowledgeable';
  //   } else if (percentage <= 70 && percentage >= 50) {
  //     return 'Average';
  //   } else if (percentage <= 40 && percentage >= 10) {
  //     return 'Noob';
  //   } else {
  //     return 'Ogobs';
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    String _score = Provider.of<AppState>(context).score;
    String _description = Provider.of<AppState>(context).description;

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
          height: MediaQuery.of(context).size.height - 50,
          padding: EdgeInsets.symmetric(
            horizontal: 10,
          ),
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Text(
                  'RESULT',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.concertOne(
                    textStyle: TextStyle(
                      color: Color(0xffE9E282),
                      fontSize: 60,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Column(
                  children: [
                    Container(
                      child: Text(
                        _score,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.passionOne(
                          textStyle: TextStyle(
                            color: Color(0xffDAD785),
                            fontSize: 70,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        _description,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.passionOne(
                          textStyle: TextStyle(
                            color: Color(0xffDAD785),
                            fontSize: 45,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: FlatButton(
                  color: Color(0xffFAA800),
                  child: Text(
                    'PLAY AGAIN',
                    style: GoogleFonts.nunito(
                      color: Color(0xff1B233F),
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  onPressed: () {
                    // Navigator.of(context).pushNamedAndRemoveUntil(
                    //     '/question', (Route<dynamic> route) => false);
                    Navigator.popAndPushNamed(context, '/home');
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
