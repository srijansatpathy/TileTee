import 'package:flutter/material.dart';
import 'package:mi_card/timer2guest.dart';
import 'package:splashscreen/splashscreen.dart';

class Splash2 extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<Splash2> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: new SplashScreen(
        seconds: 7, //7
        navigateAfterSeconds: new Launch2(),
        title: new Text(
          'Level Two: \n24 minutes of zen',
          textAlign: TextAlign.center,
          style: new TextStyle(
              fontFamily: 'Manrope',
              fontWeight: FontWeight.bold,
              fontSize: 30.0),
        ),
        loadingText: new Text(
          'Earn 2 tiles',
          textAlign: TextAlign.center,
          style: new TextStyle(
              fontFamily: 'Manrope',
              fontSize: 25,
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
          /*strCurPage = 'page6';
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('stringValue', strCurPage);
          print('6 hello!');*/
        },
        loaderColor: Colors.black,
      ),
    );
  }
}
