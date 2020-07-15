import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:mi_card/loading2guest.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mi_card/isSignedIn.dart';
import 'dart:ui' as ui;
import 'package:mi_card/intro.dart';
import 'package:flushbar/flushbar.dart';

var imageNum = 0;

class Grid1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: MaterialApp(
        theme: ThemeData(scaffoldBackgroundColor: Colors.white),
        home: Scaffold(
          floatingActionButtonLocation:
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
                          content: new Text('Quit the run-through?',
                              style: TextStyle(
                                  fontFamily: 'OpenSans',
                                  fontWeight: FontWeight.bold)),
                          actions: <Widget>[
                            new FlatButton(
                              child: new Text("Yes",
                                  style: TextStyle(
                                      fontFamily: 'OpenSans',
                                      fontWeight: FontWeight.bold)),
                              onPressed: () async {
                                strCurPage = 'page1';
                                SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                prefs.setString('stringValue', strCurPage);
                                print('1 hello!');
                                SystemNavigator.pop();
                              },
                            ),
                            // usually buttons at the bottom of the dialog
                            new FlatButton(
                              child: new Text("No",
                                  style: TextStyle(
                                      fontFamily: 'OpenSans',
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
                        fontFamily: 'OpenSans',
                        color: Colors.black),
                  ),
                  backgroundColor: Colors.blue,
                ),
                FloatingActionButton.extended(
                  heroTag: 'btn2',
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Splash2()),
                    );
                    strCurPage = 'page6';
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setString('stringValue', strCurPage);
                    print('6 hello!');
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
                        fontFamily: 'OpenSans',
                        color: Colors.black),
                  ),
                  backgroundColor: Colors.blue,
                )
              ],
            ),
          ),
          appBar: AppBar(
            title: Text(
              "LEVEL ONE (tap tile to select color)",
              style: TextStyle(
                  fontFamily: 'OpenSans', fontWeight: FontWeight.bold),
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
  int colornum = 1;

  void changeNum() {
    setState(() {
      colornum += 1;
    });
  }

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
              crossAxisCount: 1,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1,
              children: <Widget>[
                GestureDetector(
                  child: Container(
                    child: Image.asset(
                      'images/Colors/color$colornum.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                  onTap: () {
                    changeNum();
                    if (colornum == 10) {
                      colornum = 1;
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
                      fontFamily: 'OpenSans', fontWeight: FontWeight.bold),
                ),
                onPressed: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Splash2()),
                  );
                  strCurPage = 'page5';
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.setString('stringValue', strCurPage);
                  print('5 hello!');
                },
              ),
            ),
          ),*/
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 40),
            child: SizedBox(
              width: double.maxFinite,
              height: 44,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                color: Colors.black,
                child: Text(
                  "Save Mosaic",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () async {
                  convertWidgetToImage();
                  imageNum += 1;
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.setInt('intValue', imageNum);
                  Flushbar(
                    message: 'Saved to Mosaic Gallery',
                    messageText: Text(
                      'Saved to Mosaic Gallery',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'OpenSans',
                          color: Colors.white),
                    ),
                    duration: Duration(seconds: 3),
                    margin: EdgeInsets.all(10.0),
                    borderRadius: 8,
                    backgroundColor: Colors.black,
                    icon: Icon(
                      Icons.save,
                      size: 28.0,
                      color: Colors.blue,
                    ),
                  )..show(context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
