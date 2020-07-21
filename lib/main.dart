import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mi_card/guestGrid1.dart';
import 'package:mi_card/guestGrid2.dart';
import 'package:mi_card/guestGrid3.dart';
import 'package:mi_card/guestGrid4.dart';
import 'package:mi_card/guestGrid5.dart';
import 'package:mi_card/guestGrid6.dart';
import 'package:mi_card/guestGrid7.dart';
import 'package:mi_card/guestGrid8.dart';
import 'package:mi_card/intro.dart';
import 'package:mi_card/loading1guest.dart';
import 'package:mi_card/loading2guest.dart';
import 'package:mi_card/loading3guest.dart';
import 'package:mi_card/loading4guest.dart';
import 'package:mi_card/loading5guest.dart';
import 'package:mi_card/loading6guest.dart';
import 'package:mi_card/loading7guest.dart';
import 'package:mi_card/loading8guest.dart';
import 'package:mi_card/mainWelcome.dart';
import 'package:mi_card/timer1guest.dart';
import 'package:mi_card/timer2guest.dart';
import 'package:mi_card/timer3guest.dart';
import 'package:mi_card/timer4guest.dart';
import 'package:mi_card/timer5guest.dart';
import 'package:mi_card/timer6guest.dart';
import 'package:mi_card/timer7guest.dart';
import 'package:mi_card/timer8guest.dart';
import 'package:shared_preferences/shared_preferences.dart';

var strCurPage;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.black,
  ));

  SharedPreferences prefs = await SharedPreferences.getInstance();
  String stringValue = prefs.getString('stringValue');

  SharedPreferences _prefs = await SharedPreferences.getInstance();
  int intValue = _prefs.getInt('intValue');

  if (stringValue == null) {
    stringValue = 'page0';
  }
  if (intValue == null) {
    intValue = 0;
  }
  switch (stringValue) {
    case 'page0':
      {
        runApp(MaterialApp(
          home: IntroScreen(),
          debugShowCheckedModeBanner: false,
        ));
      }
      break;
    case 'page1':
      {
        imageNum = intValue;
        FirebaseUser user = await FirebaseAuth.instance.currentUser();
        id = user.email;
        runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Main()));
      }
      break;
    case 'page2':
      {
        imageNum = intValue;
        FirebaseUser user = await FirebaseAuth.instance.currentUser();
        id = user.email;
        runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Splash1()));
      }
      break;

    case 'page3':
      {
        imageNum = intValue;
        FirebaseUser user = await FirebaseAuth.instance.currentUser();
        id = user.email;
        runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
      }
      break;

    case 'page4':
      {
        imageNum = intValue;
        FirebaseUser user = await FirebaseAuth.instance.currentUser();
        id = user.email;
        runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Grid1()));
      }
      break;

    case 'page5':
      {
        imageNum = intValue;
        FirebaseUser user = await FirebaseAuth.instance.currentUser();
        id = user.email;
        runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Splash2()));
      }
      break;

    case 'page6':
      {
        imageNum = intValue;
        FirebaseUser user = await FirebaseAuth.instance.currentUser();
        id = user.email;
        runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Launch2()));
      }
      break;

    case 'page7':
      {
        imageNum = intValue;
        FirebaseUser user = await FirebaseAuth.instance.currentUser();
        id = user.email;
        runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Grid2()));
      }
      break;

    case 'page8':
      {
        imageNum = intValue;
        FirebaseUser user = await FirebaseAuth.instance.currentUser();
        id = user.email;
        runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Splash3()));
      }
      break;

    case 'page9':
      {
        imageNum = intValue;
        FirebaseUser user = await FirebaseAuth.instance.currentUser();
        id = user.email;
        runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Launch3()));
      }
      break;

    case 'page10':
      {
        imageNum = intValue;
        FirebaseUser user = await FirebaseAuth.instance.currentUser();
        id = user.email;
        runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Grid3()));
      }
      break;

    case 'page11':
      {
        imageNum = intValue;
        FirebaseUser user = await FirebaseAuth.instance.currentUser();
        id = user.email;
        runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Splash4()));
      }
      break;

    case 'page12':
      {
        imageNum = intValue;
        FirebaseUser user = await FirebaseAuth.instance.currentUser();
        id = user.email;
        runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Launch4()));
      }
      break;

    case 'page13':
      {
        imageNum = intValue;
        FirebaseUser user = await FirebaseAuth.instance.currentUser();
        id = user.email;
        runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Grid4()));
      }
      break;

    case 'page14':
      {
        imageNum = intValue;
        FirebaseUser user = await FirebaseAuth.instance.currentUser();
        id = user.email;
        runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Splash5()));
      }
      break;

    case 'page15':
      {
        imageNum = intValue;
        FirebaseUser user = await FirebaseAuth.instance.currentUser();
        id = user.email;
        runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Launch5()));
      }
      break;

    case 'page16':
      {
        imageNum = intValue;
        FirebaseUser user = await FirebaseAuth.instance.currentUser();
        id = user.email;
        runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Grid5()));
      }
      break;

    case 'page17':
      {
        imageNum = intValue;
        FirebaseUser user = await FirebaseAuth.instance.currentUser();
        id = user.email;
        runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Splash6()));
      }
      break;

    case 'page18':
      {
        imageNum = intValue;
        FirebaseUser user = await FirebaseAuth.instance.currentUser();
        id = user.email;
        runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Launch6()));
      }
      break;

    case 'page19':
      {
        imageNum = intValue;
        FirebaseUser user = await FirebaseAuth.instance.currentUser();
        id = user.email;
        runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Grid6()));
      }
      break;

    case 'page20':
      {
        imageNum = intValue;
        FirebaseUser user = await FirebaseAuth.instance.currentUser();
        id = user.email;
        runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Splash7()));
      }
      break;

    case 'page21':
      {
        imageNum = intValue;
        FirebaseUser user = await FirebaseAuth.instance.currentUser();
        id = user.email;
        runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Launch7()));
      }
      break;

    case 'page22':
      {
        imageNum = intValue;
        FirebaseUser user = await FirebaseAuth.instance.currentUser();
        id = user.email;
        runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Grid7()));
      }
      break;

    case 'page23':
      {
        imageNum = intValue;
        FirebaseUser user = await FirebaseAuth.instance.currentUser();
        id = user.email;
        runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Splash8()));
      }
      break;

    case 'page24':
      {
        imageNum = intValue;
        FirebaseUser user = await FirebaseAuth.instance.currentUser();
        id = user.email;
        runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Launch8()));
      }
      break;

    case 'page25':
      {
        imageNum = intValue;
        FirebaseUser user = await FirebaseAuth.instance.currentUser();
        id = user.email;
        runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Grid8()));
      }
      break;

    /*case 'page26':
      {
        imageNum = intValue;
        FirebaseUser user = await FirebaseAuth.instance.currentUser();
        id = user.email;
        runApp(MaterialApp(home: Splash9()));
      }
      break;

    case 'page27':
      {
        imageNum = intValue;
        FirebaseUser user = await FirebaseAuth.instance.currentUser();
        id = user.email;
        runApp(MaterialApp(home: Launch9()));
      }
      break;

    case 'page28':
      {
        imageNum = intValue;
        FirebaseUser user = await FirebaseAuth.instance.currentUser();
        id = user.email;
        runApp(MaterialApp(home: Grid9()));
      }
      break;

    case 'page29':
      {
        imageNum = intValue;
        FirebaseUser user = await FirebaseAuth.instance.currentUser();
        id = user.email;
        runApp(MaterialApp(home: Splash10()));
      }
      break;
    case 'page30':
      {
        imageNum = intValue;
        FirebaseUser user = await FirebaseAuth.instance.currentUser();
        id = user.email;
        runApp(MaterialApp(home: Launch10()));
      }
      break;
    case 'page31':
      {
        imageNum = intValue;
        FirebaseUser user = await FirebaseAuth.instance.currentUser();
        id = user.email;
        runApp(MaterialApp(home: Grid10()));
      }
      break;*/

    default:
      {
        print("Invalid choice");
      }
      break;
  }

  /*Future<void> navig() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var email = prefs.getString('email');
    print(email);
    runApp(MaterialApp(home: email == null ? Main() : Main()));
  }

  navig();*/
}
/*
  runApp(MaterialApp(
    home: AnimatedSplash(
        imagePath: 'images/logo.png',
        home: Dashb(),
        customFunction: navig,
        duration: 2500,
        type: AnimatedSplashType.BackgroundProcess),
  ));*/
