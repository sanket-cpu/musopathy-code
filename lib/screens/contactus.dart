import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:musopathy/screens/adduser.dart';
import 'package:musopathy/screens/languagePage.dart';
import 'package:musopathy/screens/register.dart';
import 'package:musopathy/screens/signin.dart';
import 'package:musopathy/screens/splashScreen.dart';
import 'package:musopathy/screens/videopage.dart';
import 'package:musopathy/screens/loginUI.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

class ContactScreen extends StatefulWidget {
  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color.fromRGBO(40, 115, 161, 1.0)),
        backgroundColor: Colors.white,
        //   brightness: Brightness.light,
        //   iconTheme: IconThemeData(
        //     color: Theme.of(context).primaryColor,
        //   ),
        //   toolbarHeight: 50,
        //   backgroundColor: Color(0xFFDFDFDF),
        //   automaticallyImplyLeading: true,
        title: Text(
          'M U S O P A T H Y',
          style: TextStyle(
            fontFamily: 'Ubuntu',
            fontSize: 20,
            color: Color.fromRGBO(40, 115, 161, 1.0),
            fontWeight: FontWeight.normal,
          ),
        ),
        //   actions: [],
        //   centerTitle: true,
        //   elevation: 4,
      ),
      drawer: Drawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                ClipRRect(
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                          Colors.white,
                          // Color.fromRGBO(202, 202, 202, 1.0),
                          Color.fromRGBO(40, 115, 161, 1.0)
                          // Color.fromRGBO(1, 67, 88, 1.0)
                        ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter)),
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
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: GestureDetector(
                onTap: () async {
                  Email email = Email(
                    body: 'Email body',
                    subject: 'Email subject',
                    recipients: ['Wellness@musopathy.com'],
                    isHTML: false,
                  );

                  await FlutterEmailSender.send(email);
                },
                child: Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      elevation: 4,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "For Queries Contact",
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  fontFamily: 'Poppins', fontSize: 20),
                            ),
                            Text(
                              "Musopathy Foundation",
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  fontFamily: 'Poppins', fontSize: 18),
                            ),
                            Text(
                              "Email: Wellness@musopathy.com",
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  fontFamily: 'Poppins', fontSize: 18),
                            ),
                            Text(
                              "Phone/whatsapp: +91 9663378987",
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  fontFamily: 'Poppins', fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    )),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
          ]),
        ),
      ),
    );
  }
}
