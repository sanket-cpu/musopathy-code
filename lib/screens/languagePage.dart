import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musopathy/screens/videopage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Language extends StatefulWidget {
  @override
  _LanguageState createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("choose language"),
      ),
      body: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              ClipRRect(
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Colors.white,
                    // Color.fromRGBO(202, 202, 202, 1.0),
                    Color.fromRGBO(40, 115, 161, 1.0)
                    // Color.fromRGBO(1, 67, 88, 1.0)
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 3.5,
                ),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(35.0),
                    bottomRight: Radius.circular(35)),
              ),
              /* Positioned(
                    bottom: 200,
                    left: 90,
                    child: Text(
                      'MUSOPATHY',
                      style: TextStyle(
                          fontFamily: 'Ubuntu',
                          fontSize: 22.0,
                          letterSpacing: 4,
                          color: Colors.black),
                    ),
                  ),*/
              Positioned(
                  bottom: 170,
                  left: 90,
                  child: Text(
                    'TONATION',
                    style: GoogleFonts.poiretOne(
                      textStyle: TextStyle(
                          letterSpacing: 2,
                          color: Color.fromRGBO(1, 67, 88, 1.0),
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
              Positioned(
                bottom: 140,
                left: 90,
                child: Text(
                  'BREATHING',
                  style: GoogleFonts.poiretOne(
                      textStyle: TextStyle(
                          letterSpacing: 2,
                          color: Color.fromRGBO(1, 67, 88, 1.0),
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              Positioned(
                bottom: 110,
                left: 90,
                child: Text(
                  'TECHNIQUES',
                  style: GoogleFonts.poiretOne(
                      textStyle: TextStyle(
                          letterSpacing: 2,
                          color: Color.fromRGBO(1, 67, 88, 1.0)),
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Positioned(
                bottom: -50,
                right: -80,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2.7,
                  child: ClipRRect(
                    child: Image(
                      image: AssetImage('assets/images/meditatingman.png'),
                    ),
                  ),
                ),
              )
            ],
            clipBehavior: Clip.antiAlias,
          ),
          SizedBox(
            height: 100,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(14, 81, 102, 1.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 14)),
                  onPressed: () => Navigator.push(
                      context, MaterialPageRoute(builder: (_) => VideoPage())),
                  child: new Text(
                    "English",
                    textAlign: TextAlign
                        .center, //without alignment the size is according to the text
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.pink.shade900,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 14)),
                  onPressed: () => Navigator.push(
                      context, MaterialPageRoute(builder: (_) => VideoPage())),
                  child: new Text(
                    "Tamil",
                    textAlign: TextAlign
                        .center, //without alignment the size is according to the text
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
                /* GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => VideoPage()));
                  },
                  child: new Container(
                    //  margin: EdgeInsets.symmetric(horizontal: 70.0),
                    alignment: Alignment
                        .center, // on giving this the container got its size later
                    height: 45.0,
                    decoration: BoxDecoration(
                      color: Colors.indigo.shade800,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: new Text(
                      "English", //without alignment the size is according to the text
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.0,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                ), */
                /* GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => VideoPage()));
                  },
                  child: new Container(
                    //margin: EdgeInsets.symmetric(horizontal: 70.0),
                    alignment: Alignment
                        .center, // on giving this the container got its size later
                    height: 45.0,
                    decoration: BoxDecoration(
                      color: Colors.red.shade500,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: new Text(
                      "Tamil", //without alignment the size is according to the text
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.0,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                ), */
              ],
            ),
          ),
        ],
      ),
    );
  }
}
