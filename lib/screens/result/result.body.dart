import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultBody extends StatelessWidget {
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
          height: MediaQuery.of(context).size.height - 50,
          padding: EdgeInsets.symmetric(
            horizontal: 40,
          ),
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                          '6/10',
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
                          'Average',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.passionOne(
                            textStyle: TextStyle(
                              color: Color(0xffDAD785),
                              fontSize: 50,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
              Container(
                child: FlatButton(
                  child: Text(
                    'PLAY AGAIN',
                    style: GoogleFonts.nunito(
                      color: Colors.white,
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
