import 'package:flutter/material.dart';
import 'package:musopathy/fields/registerwidget.dart';
import 'package:musopathy/fields/signinwidget.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  var key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final tabcontroller = new TabController(length: 2, vsync: this);

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
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Stack(
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
                      height: MediaQuery.of(context).size.height / 4,
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
                      height: MediaQuery.of(context).size.height / 3,
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
              TabBar(
                indicatorColor: Colors.cyan.shade900,
                controller: tabcontroller,
                tabs: [
                  Tab(
                    child: Text(
                      "Login",
                      style:
                          TextStyle(color: Colors.cyan.shade900, fontSize: 18),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Register",
                      style:
                          TextStyle(color: Colors.cyan.shade900, fontSize: 18),
                    ),
                  ),
                ],
              ),
              Expanded(
                  child: TabBarView(
                children: [
                  SignIn(),
                  Register(),
                ],
                controller: tabcontroller,
              ))
            ],
          ),
        ),
      ),
    );
  }
}
