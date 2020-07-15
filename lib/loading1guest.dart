import 'package:flutter/material.dart';
import 'package:mi_card/timer1guest.dart';
import 'package:splashscreen/splashscreen.dart';

class Splash1 extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<Splash1> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: new SplashScreen(
        seconds: 3, //7
        navigateAfterSeconds: new MyApp(),
        title: new Text(
          'Level One: \nPut the phone down',
          textAlign: TextAlign.center,
          style: new TextStyle(
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.bold,
              fontSize: 30.0),
        ),
        loadingText: new Text(
          'Get ready for 5 minutes of zen',
          textAlign: TextAlign.center,
          style: new TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic),
        ),
        image: new Image.asset('images/time.png'),
        gradientBackground: new LinearGradient(
            colors: [Colors.blue, Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 80.0,
        onClick: () async {
          /*strCurPage = 'page3';
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('stringValue', strCurPage);
          print('3 hello!');*/
        },
        loaderColor: Colors.black,
      ),
    );
  }
}