import 'package:flutter/material.dart';
import 'package:mi_card/timer5guest.dart';
import 'package:splashscreen/splashscreen.dart';

class Splash5 extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<Splash5> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: new SplashScreen(
        seconds: 3, //7
        navigateAfterSeconds: new Launch5(),
        title: new Text(
          'Level Five: \nPut the phone down',
          textAlign: TextAlign.center,
          style: new TextStyle(
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.bold,
              fontSize: 30.0),
        ),
        loadingText: new Text(
          'Get ready for 25 minutes of zen',
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
          /*strCurPage = 'page12';
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('stringValue', strCurPage);
          print('12 hello!');*/
        },
        loaderColor: Colors.black,
      ),
    );
  }
}