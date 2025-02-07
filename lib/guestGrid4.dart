import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:mi_card/guestGrid1.dart';
import 'package:mi_card/intro.dart';
import 'package:mi_card/mainWelcome.dart';
import 'package:mi_card/timer1guest.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:ui' as ui;
import 'dart:async';

class Grid4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(scaffoldBackgroundColor: Colors.white),
        home: Scaffold(
          /*floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 142.0, right: 10, left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FloatingActionButton.extended(
                  heroTag: 'btn1',
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        // return object of type Dialog
                        return AlertDialog(
                          content: new Text(
                              'Quit the run-through?',
                              style: TextStyle(
                                  fontFamily: 'Manrope',
                                  fontWeight: FontWeight.bold)),
                          actions: <Widget>[
                            new FlatButton(
                              child: new Text("Yes",
                                  style: TextStyle(
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.bold)),
                              onPressed: () async {
                                strCurPage = 'page1';
                                SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                prefs.setString('stringValue', strCurPage);
                                print('1 hello!');
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Main()),
                                );
                              },
                            ),
                            // usually buttons at the bottom of the dialog
                            new FlatButton(
                              child: new Text("No",
                                  style: TextStyle(
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.bold)),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                    /*Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Main()));*/
                    /*Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Main()),
                  );*/
                  },
                  icon: Icon(
                    Icons.exit_to_app,
                    color: Colors.black,
                  ),
                  label: Text(
                    'Exit',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Manrope',
                        color: Colors.black),
                  ),
                  backgroundColor: Colors.blue,
                ),
                FloatingActionButton.extended(
                  heroTag: 'btn2',
                  onPressed: () async {
                    timestamp = DateTime.now().millisecondsSinceEpoch;
                    timestamp += 7000;
                    SharedPreferences prefs1 = await SharedPreferences.getInstance();
                    prefs1.setInt('myTimestampKey', timestamp);

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Splash5()),
                    );
                    strCurPage = 'page15';
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setString('stringValue', strCurPage);
                    print('15 hello!');
                    /*Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (context) => Main()));*/
                    /*Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SavedMosaics()),
                    );*/
                  },
                  icon: Icon(
                    Icons.arrow_forward,
                    color: Colors.black,
                  ),
                  label: Text(
                    'Next Level',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Manrope',
                        color: Colors.black),
                  ),
                  backgroundColor: Colors.blue,
                )
              ],
            ),
          ),*/
          appBar: AppBar(
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                  size: 40.0,
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Main()));
                },
              )
            ],
            title: Text(
              "16 TILES (tap to select color)",
              style: TextStyle(
                  fontFamily: 'Manrope', fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.black,
          ),
          body: HomePage(),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey _containerKey = GlobalKey();
  StorageReference storageReference = FirebaseStorage().ref();
  bool loading = false;

  void convertWidgetToImage() async {
    RenderRepaintBoundary renderRepaintBoundary =
        _containerKey.currentContext.findRenderObject();
    ui.Image boxImage = await renderRepaintBoundary.toImage(pixelRatio: 1);
    ByteData byteData =
        await boxImage.toByteData(format: ui.ImageByteFormat.png);
    Uint8List uint8list = byteData.buffer.asUint8List();
    this.setState(() {
      loading = true;
    });
    StorageUploadTask storageUploadTask = storageReference
        .child('mosaics/users/$id/$imageNum.png')
        .putData(uint8list);
    await storageUploadTask.onComplete;
    this.setState(() {
      loading = false;
    });
  }

  int _languageIndex = -1;
  int colornum1 = 1;
  int colornum2 = 1;
  int colornum3 = 1;
  int colornum4 = 1;
  int colornum5 = 1;
  int colornum6 = 1;
  int colornum7 = 1;
  int colornum8 = 1;
  int colornum9 = 1;
  int colornum10 = 1;
  int colornum11 = 1;
  int colornum12 = 1;
  int colornum13 = 1;
  int colornum14 = 1;
  int colornum15 = 1;
  int colornum16 = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          RepaintBoundary(
            key: _containerKey,
            child: GridView.count(
              crossAxisCount: 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1,
              children: <Widget>[
                GestureDetector(
                  child: Container(
                    child: Image.asset(
                      'images/Colors/color$colornum1.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      colornum1 += 1;
                    });
                    if (colornum1 == 10) {
                      colornum1 = 1;
                    }
                  },
                ),
                GestureDetector(
                  child: Container(
                    child: Image.asset(
                      'images/Colors/color$colornum2.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      colornum2 += 1;
                    });
                    if (colornum2 == 10) {
                      colornum2 = 1;
                    }
                  },
                ),
                GestureDetector(
                  child: Container(
                    child: Image.asset(
                      'images/Colors/color$colornum3.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      colornum3 += 1;
                    });
                    if (colornum3 == 10) {
                      colornum3 = 1;
                    }
                  },
                ),
                GestureDetector(
                  child: Container(
                    child: Image.asset(
                      'images/Colors/color$colornum4.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      colornum4 += 1;
                    });
                    if (colornum4 == 10) {
                      colornum4 = 1;
                    }
                  },
                ),
                GestureDetector(
                  child: Container(
                    child: Image.asset(
                      'images/Colors/color$colornum5.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      colornum5 += 1;
                    });
                    if (colornum5 == 10) {
                      colornum5 = 1;
                    }
                  },
                ),
                GestureDetector(
                  child: Container(
                    child: Image.asset(
                      'images/Colors/color$colornum6.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      colornum6 += 1;
                    });
                    if (colornum6 == 10) {
                      colornum6 = 1;
                    }
                  },
                ),
                GestureDetector(
                  child: Container(
                    child: Image.asset(
                      'images/Colors/color$colornum7.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      colornum7 += 1;
                    });
                    if (colornum7 == 10) {
                      colornum7 = 1;
                    }
                  },
                ),
                GestureDetector(
                  child: Container(
                    child: Image.asset(
                      'images/Colors/color$colornum8.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      colornum8 += 1;
                    });
                    if (colornum8 == 10) {
                      colornum8 = 1;
                    }
                  },
                ),
                GestureDetector(
                  child: Container(
                    child: Image.asset(
                      'images/Colors/color$colornum9.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      colornum9 += 1;
                    });
                    if (colornum9 == 10) {
                      colornum9 = 1;
                    }
                  },
                ),
                GestureDetector(
                  child: Container(
                    child: Image.asset(
                      'images/Colors/color$colornum10.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      colornum10 += 1;
                    });
                    if (colornum10 == 10) {
                      colornum10 = 1;
                    }
                  },
                ),
                GestureDetector(
                  child: Container(
                    child: Image.asset(
                      'images/Colors/color$colornum11.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      colornum11 += 1;
                    });
                    if (colornum11 == 10) {
                      colornum11 = 1;
                    }
                  },
                ),
                GestureDetector(
                  child: Container(
                    child: Image.asset(
                      'images/Colors/color$colornum12.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      colornum12 += 1;
                    });
                    if (colornum12 == 10) {
                      colornum12 = 1;
                    }
                  },
                ),
                GestureDetector(
                  child: Container(
                    child: Image.asset(
                      'images/Colors/color$colornum13.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      colornum13 += 1;
                    });
                    if (colornum13 == 10) {
                      colornum13 = 1;
                    }
                  },
                ),
                GestureDetector(
                  child: Container(
                    child: Image.asset(
                      'images/Colors/color$colornum14.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      colornum14 += 1;
                    });
                    if (colornum14 == 10) {
                      colornum14 = 1;
                    }
                  },
                ),
                GestureDetector(
                  child: Container(
                    child: Image.asset(
                      'images/Colors/color$colornum15.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      colornum15 += 1;
                    });
                    if (colornum15 == 10) {
                      colornum15 = 1;
                    }
                  },
                ),
                GestureDetector(
                  child: Container(
                    child: Image.asset(
                      'images/Colors/color$colornum16.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      colornum16 += 1;
                    });
                    if (colornum16 == 10) {
                      colornum16 = 1;
                    }
                  },
                ),
              ],
            ),
          ),
          (loading)
              ? Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.white,
                  ),
                )
              : Center(),
          /*Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: SizedBox(
              width: double.maxFinite,
              height: 44,
              child: RaisedButton(
                child: Text(
                  "NEXT LEVEL",
                  style: TextStyle(
                      fontFamily: 'Manrope', fontWeight: FontWeight.bold),
                ),
                onPressed: () {},
              ),
            ),
          ),*/
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 40),
            child: SizedBox(
              width: double.maxFinite,
              height: 50,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                color: Colors.black,
                child: Text(
                  "Save Mosaic",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () async {
                  convertWidgetToImage();
                  imageNum += 1;
                  SharedPreferences prefs =
                  await SharedPreferences.getInstance();
                  prefs.setInt('intValue', imageNum);
                  tileNum -= 16;
                  SharedPreferences _prefs =
                  await SharedPreferences.getInstance();
                  _prefs.setInt('tiles', tileNum);
                  Flushbar(
                    message: 'You just used 16 tiles',
                    messageText: Text(
                      'You just used 16 tiles',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Manrope',
                          fontSize: 15.0,
                          color: Colors.white),
                    ),
                    duration: Duration(seconds: 3),
                    margin: EdgeInsets.all(10.0),
                    borderRadius: 8,
                    backgroundColor: Colors.black,
                    icon: Icon(
                      Icons.crop_square,
                      size: 28.0,
                      color: Colors.blue,
                    ),
                  )..show(context);
                  Future.delayed(const Duration(seconds: 3), () {
                    setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Main()),
                      );
                    });
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
