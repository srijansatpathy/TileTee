import 'package:flutter/material.dart';
import 'package:mi_card/timer8guest.dart';
import 'package:splashscreen/splashscreen.dart';

class Splash8 extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<Splash8> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: new SplashScreen(
        seconds: 7, //7
        navigateAfterSeconds: new Launch8(),
        title: new Text(
          'Level Eight: \n96 minutes of zen',
          textAlign: TextAlign.center,
          style: new TextStyle(
              fontFamily: 'Manrope',
              fontWeight: FontWeight.bold,
              fontSize: 30.0),
        ),
        loadingText: new Text(
          'Earn 8 tiles',
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
