import "package:flutter/material.dart";
import 'package:musopathy/screens/adduser.dart';
import 'package:musopathy/screens/intropage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Image.asset(
                  'assets/images/background-crop.jpg',
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
                Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
                      child: Text(
                        'Covi Sup',
                        style: TextStyle(
                          fontFamily: 'Ubuntu',
                          color: Color(0xFFDFDFDF),
                          fontSize: 40,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(50, 25, 30, 0),
                      child: Text(
                        'Musopathy Tonation Breathing Techniques for Covid Symptoms, Anxiety & Depression ',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Ubuntu',
                          color: Color(0xFFDFDFDF),
                        ),
                      ),
                    ),
                    Opacity(
                      opacity: 0.7,
                      child: Image.asset(
                        'assets/images/muso.png',
                        width: 350,
                        height: 350,
                        fit: BoxFit.cover,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) => IntroScreen())),
                      child: new Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 85.0, vertical: 40),
                        alignment: Alignment
                            .center, // on giving this the container got its size later
                        height: 45.0,
                        decoration: BoxDecoration(
                          color: Colors.blue.shade100,
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: new Text(
                          "Start", //without alignment the size is according to the text
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 22.0,
                            fontWeight: FontWeight.normal,
                            letterSpacing: 1.5,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
