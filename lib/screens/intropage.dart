import "package:flutter/material.dart";
import 'package:musopathy/screens/adduser.dart';
import 'package:musopathy/screens/languagePage.dart';
import 'package:musopathy/screens/register.dart';
import 'package:musopathy/screens/signin.dart';
import 'package:musopathy/screens/splashScreen.dart';
import 'package:musopathy/screens/videopage.dart';
import 'package:musopathy/screens/loginUI.dart';
import 'package:video_player/video_player.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;
  final GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        //  "https://player.vimeo.com/video/562218277?badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479");
        "https://firebasestorage.googleapis.com/v0/b/musopathy-bfaea.appspot.com/o/covi_intro.mp4?alt=media&token=bb0f3f6a-0103-4079-8ac7-1bec9535f84b");
    _controller.addListener(() {
      setState(() {});
    });

    _controller.setLooping(true);
    _initializeVideoPlayerFuture = _controller.initialize();
    // _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
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
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 3,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30.0),
                          bottomRight: Radius.circular(30)),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30)),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: FutureBuilder(
                        future: _initializeVideoPlayerFuture,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return AspectRatio(
                              aspectRatio: _controller.value.aspectRatio,
                              child: Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  VideoPlayer(_controller),
                                  //  ClosedCaption(text: _controller.value.caption.text),
                                  _ControlsOverlay(controller: _controller),
                                  VideoProgressIndicator(_controller,
                                      allowScrubbing: true),
                                ],
                              ),
                            );
                          } else {
                            return Center(child: CircularProgressIndicator());
                          }
                        },
                      ),
                    ),
                  ),
                  /*  Positioned(
                    top: 50.0,
                    left: 20.0,
                    child: IconButton(
                      icon: Icon(Icons.menu),
                      iconSize: 30.0,
                      color: Theme.of(context).primaryColor,
                      onPressed: () => key.currentState.openDrawer(),
                    ),
                  ),*/
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: Text(
                  'Musopathy provides revolutionary tools for individual and organizational Health and Wellness like the Tonation Breathing Techniques (TBT) Program to manage Covid Symptoms, Anxiety and Depression.  TBT is a specially evolved program that includes diverse non-strenuous Breathing techniques anchored on published studies by Harvard, Johns Hopkins etc.  The special feature is the addition of Tonation through nostrils or lips to most techniques which has enabled hundreds to improve their lung, immunological and psychological health besides increasing focus energy, clarity, decision making abilities and decreasing stress and fatigue.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontFamily: 'Poppins', fontSize: 16),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              /* GestureDetector(
                onTap: () {
                  _controller.pause();
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => MyHomePage()));
                },
                child: new Container(
                  margin: EdgeInsets.symmetric(horizontal: 70.0),
                  alignment: Alignment
                      .center, // on giving this the container got its size later
                  height: 45.0,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(
                        14, 81, 102, 1.0), //Colors.indigo.shade800,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: new Text(
                    "Join Us", // 😊",
                    textAlign: TextAlign
                        .center, //without alignment the size is according to the text
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              GestureDetector(
                onTap: () => Navigator.push(
                    context, MaterialPageRoute(builder: (_) => Language())),
                child: */
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(40, 115, 161, 1.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0)),
                    padding: EdgeInsets.symmetric(horizontal: 100)),
                onPressed: () => Navigator.push(
                    context, MaterialPageRoute(builder: (_) => MyHomePage())),
                child: new Text(
                  "Join Us",
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
                    primary: Color.fromRGBO(162, 86, 99, 1.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0)),
                    padding: EdgeInsets.symmetric(horizontal: 100.0)),
                onPressed: () => Navigator.push(
                    context, MaterialPageRoute(builder: (_) => Language())),
                child: new Text(
                  "Videos",
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

              //),
              // ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ControlsOverlay extends StatelessWidget {
  _ControlsOverlay({@required this.controller});

  static const _examplePlaybackRates = [
    0.25,
    0.5,
    1.0,
    1.5,
    2.0,
    3.0,
    5.0,
    10.0,
  ];

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedSwitcher(
          duration: Duration(milliseconds: 50),
          reverseDuration: Duration(milliseconds: 200),
          child: controller.value.isPlaying
              ? SizedBox.shrink()
              : Container(
                  color: Colors.black26,
                  child: Center(
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                      size: 100.0,
                    ),
                  ),
                ),
        ),
        GestureDetector(
          onTap: () {
            controller.value.isPlaying ? controller.pause() : controller.play();
          },
        ),
        Align(
          alignment: Alignment.topRight,
          child: PopupMenuButton<double>(
            initialValue: controller.value.playbackSpeed,
            tooltip: 'Playback speed',
            onSelected: (speed) {
              controller.setPlaybackSpeed(speed);
            },
            itemBuilder: (context) {
              return [
                for (final speed in _examplePlaybackRates)
                  PopupMenuItem(
                    value: speed,
                    child: Text('${speed}x'),
                  )
              ];
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                // Using less vertical padding as the text is also longer
                // horizontally, so it feels like it would need more spacing
                // horizontally (matching the aspect ratio of the video).
                vertical: 12,
                horizontal: 16,
              ),
              child: Text('${controller.value.playbackSpeed}x'),
            ),
          ),
        ),
      ],
    );
  }
}
