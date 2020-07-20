import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mi_card/feedbackPage.dart';
import 'package:mi_card/introRecap.dart';
import 'package:mi_card/main.dart';
import 'package:mi_card/loading1guest.dart';
import 'package:flutter/services.dart';
import 'package:mi_card/savedMosaics.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Main extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();

  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}

class _MyAppState extends State<Main> {
  /*String _email, _password;
  static const _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random.secure();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));*/

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
          child: new Scaffold(
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            floatingActionButton: Padding(
              padding: const EdgeInsets.only(bottom: 30.0, right: 23.0, left: 23.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FloatingActionButton(
                    heroTag: 'btn1',
                    child: Icon(Icons.replay, color: Colors.black,),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => IntroRecap(),
                            fullscreenDialog: true),
                      );
                    },
                    /*icon: Icon(
                      Icons.replay,
                      color: Colors.black,
                    ),*/
                    /*label: Text(
                      'Intro',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'OpenSans',
                          color: Colors.black),
                    ),*/
                    backgroundColor: Colors.blue,
                  ),
                  FloatingActionButton(
                    heroTag: 'btn2',
                    child: Icon(Icons.feedback, color: Colors.black,),
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FeedbackPage(),
                          ));
                    },
                    /*icon: Icon(
                      Icons.lightbulb_outline,
                      color: Colors.black,
                    ),*/
                    /*label: Text(
                      'Feedback',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'OpenSans',
                          color: Colors.black),
                    ),*/
                    backgroundColor: Colors.blue,
                  )
                ],
              ),
            ),
            /*floatingActionButton: Padding(
              padding: const EdgeInsets.only(right: 7.0, bottom: 10.0),
              child: FloatingActionButton.extended(
                backgroundColor: Colors.blue,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FeedbackPage(),
                      ));
                },
                label: Text(
                  'Feedback',
                  style: TextStyle(
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                icon: Icon(
                  Icons.record_voice_over,
                  color: Colors.black,
                ),
              ),
            ),*/
            backgroundColor: Colors.white,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 90.0),
                      child: Container(
                        child: Image.asset(
                          'images/logozoom.png',
                          height: 220,
                          width: 220,
                          alignment: Alignment.topCenter,
                        ),
                      ),
                    ),
                    /*SizedBox(
                      height: 0,
                      width: 240,
                      child: Divider(
                        color: Colors.black,
                        thickness: 2,
                      ),
                    ),
                    Text(
                      'Build beautiful mosaics. \nWear your designs. \nSpend less screen time.',
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 8,
                      width: 240,
                      child: Divider(
                        color: Colors.black,
                        thickness: 2,
                      ),
                    ),*/
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        color: Colors.black,
                        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                        child: ListTile(
                          leading: Icon(Icons.arrow_forward, color: Colors.blue),
                          title: Text(
                            'MOSAIC BUILDER',
                            style: TextStyle(
                                fontFamily: 'OpenSans',
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          onTap: () async {
                            /*_email = getRandomString(5) + '@random.com';
                            _password = getRandomString(6).trim();
                            print(_email);
                            print(_password);
                            try {
                              FirebaseUser user = (await FirebaseAuth.instance
                                      .createUserWithEmailAndPassword(
                                          email: _email.trim(), password: _password))
                                  .user;
                            } catch (e) {
                              _email = getRandomString(5) + '@random.com';
                              FirebaseUser user = (await FirebaseAuth.instance
                                      .createUserWithEmailAndPassword(
                                          email: _email.trim(), password: _password))
                                  .user;
                            }*/
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Splash1()),
                            );
                            strCurPage = 'page3';
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            prefs.setString('stringValue', strCurPage);
                            print('3 hello!');
                          },
                        ),
                      ),
                    ),
                    Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        color: Colors.black,
                        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                        child: ListTile(
                          leading: Icon(Icons.save, color: Colors.blue),
                          title: Text(
                            'MOSAIC GALLERY',
                            style: TextStyle(
                                fontFamily: 'OpenSans',
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SavedMosaics()),
                            );
                          },
                        )),
                  ],
                ),
              ),
            ),
          ),
    );
  }
}
