import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoriesBody extends StatefulWidget {
  @override
  _CategoriesBodyState createState() => _CategoriesBodyState();
}

class _CategoriesBodyState extends State<CategoriesBody> {
  final List<dynamic> _imageList = [
    ['assets/images/earthquake.png', 'Earthquake'],
    ['assets/images/flood.png', 'Flashflood'],
    ['assets/images/typhoon.png', 'Typhoon'],
    ['assets/images/tsunami.png', 'Tsunami'],
    ['assets/images/eruption.png', 'Volcanic Eruption'],
  ];

  Widget circularButton({String title, String image}) {
    return Container(
      child: Column(
        children: [
          RaisedButton(
            color: Color(0xff3B4768),
            shape: CircleBorder(),
            onPressed: () {
              Navigator.pushNamed(context, '/scoredesc');
            },
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                height: 50,
                width: 50,
                child: Image.asset(image),
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Text(
                title,
                style: GoogleFonts.concertOne(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
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
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: 15,
                    bottom: 45,
                  ),
                  child: Text(
                    'PICK A CATEGORY',
                    style: GoogleFonts.concertOne(
                      textStyle: TextStyle(
                        color: Color(0xffDAD785),
                        fontSize: 35,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  // width: MediaQuery.of(context).size.width - 40,
                  // height: 500,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: GridView.count(
                      crossAxisCount: 2,
                      children: _imageList.map((image) {
                        return Center(
                          child:
                              circularButton(title: image[1], image: image[0]),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
