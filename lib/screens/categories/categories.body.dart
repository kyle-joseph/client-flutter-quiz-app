import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ndia_app/services/connection.dart';
import 'package:ndia_app/state/app_state.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

class CategoriesBody extends StatefulWidget {
  @override
  _CategoriesBodyState createState() => _CategoriesBodyState();
}

class _CategoriesBodyState extends State<CategoriesBody> {
  Connection conn = new Connection();
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
            onPressed: () async {
              bool connection = await conn.checkConnection();
              if (connection) {
                Navigator.pushNamed(context, '/scoredesc');
                Provider.of<AppState>(context, listen: false)
                    .setCategory(title);
              } else {
                Toast.show("No Internet Connection", context,
                    duration: 5, gravity: Toast.BOTTOM);
              }
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
