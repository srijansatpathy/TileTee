import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mi_card/guestGrid1.dart';
import 'package:mi_card/guestGrid2.dart';
import 'package:mi_card/guestGrid3.dart';
import 'package:mi_card/guestGrid4.dart';
import 'package:mi_card/guestGrid5.dart';
import 'package:mi_card/guestGrid6.dart';
import 'package:mi_card/guestGrid7.dart';
import 'package:mi_card/guestGrid8.dart';
import 'package:mi_card/mainWelcome.dart';
import 'package:mi_card/timer1guest.dart';
import 'package:shared_preferences/shared_preferences.dart';

int donations;

class StatsPage extends StatefulWidget {
  @override
  _StatsPageState createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.crop_square,
              color: Colors.white,
              size: 40.0,
            ),
            onPressed: () {
              if (tileNum == 0){
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    // return object of type Dialog
                    return AlertDialog(
                      content: new Text('You have no tiles right now',
                          style: TextStyle(
                              fontFamily: 'Manrope', fontWeight: FontWeight.bold)),
                      actions: <Widget>[
                        new FlatButton(
                          child: new Text("OK",
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
              }
              else{
                if (1<=tileNum && tileNum<4){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Grid1()),
                  );
                }
                else if (4<=tileNum && tileNum<9){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Grid2()),
                  );
                }
                else if (9<=tileNum && tileNum<16){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Grid3()),
                  );
                }
                else if (16<=tileNum && tileNum<25){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Grid4()),
                  );
                }
                else if (25<=tileNum && tileNum<36){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Grid5()),
                  );
                }
                else if (36<=tileNum && tileNum<49){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Grid6()),
                  );
                }
                else if (49<=tileNum && tileNum<64){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Grid7()),
                  );
                }
                else if (64<=tileNum){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Grid8()),
                  );
                }
              }
            },
          ),
          IconButton(
            icon: Icon(Icons.sentiment_satisfied, color: Colors.white, size: 40.0,),
            onPressed: (){
              if (tileNum < 100){ //100
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    // return object of type Dialog
                    return AlertDialog(
                      content: new Text('Donating a shirt to charity costs 100 tiles', //100
                          style: TextStyle(
                              fontFamily: 'Manrope', fontWeight: FontWeight.bold)),
                      actions: <Widget>[
                        new FlatButton(
                          child: new Text("OK",
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
              }
              else {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    // return object of type Dialog
                    return AlertDialog(
                      content: new Text('Would you like to donate a shirt?',
                          style: TextStyle(
                              fontFamily: 'Manrope', fontWeight: FontWeight.bold)),
                      actions: <Widget>[
                        new FlatButton(
                          child: new Text("Yes",
                              style: TextStyle(
                                  fontFamily: 'Manrope',
                                  fontWeight: FontWeight.bold)),
                          onPressed: () async{
                            Navigator.of(context).pop();
                            donations += 1;
                            SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                            prefs.setInt('donationsNum', donations);
                            tileNum -= 100; //100
                            SharedPreferences _prefs =
                            await SharedPreferences.getInstance();
                            _prefs.setInt('tiles', tileNum);
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                // return object of type Dialog
                                return AlertDialog(
                                  content: new Text("Thank you! We will fulfill your donations to this quarter's charity when you buy a TileTee", //100
                                      style: TextStyle(
                                          fontFamily: 'Manrope', fontWeight: FontWeight.bold)),
                                  actions: <Widget>[
                                    new FlatButton(
                                      child: new Text("OK",
                                          style: TextStyle(
                                              fontFamily: 'Manrope',
                                              fontWeight: FontWeight.bold)),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => Main()),
                                        );
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                            /*Flushbar(
                              message: "Thank you! We will deliver a shirt on your behalf to this quarter's charity",
                              messageText: Text(
                                "Thank you! We will deliver a shirt on your behalf to this quarter's charity",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Manrope',
                                    fontSize: 15.0,
                                    color: Colors.white),
                              ),
                              duration: Duration(seconds: 5),
                              margin: EdgeInsets.all(10.0),
                              borderRadius: 8,
                              backgroundColor: Colors.black,
                              icon: Icon(
                                Icons.send,
                                size: 28.0,
                                color: Colors.blue,
                              ),
                            )..show(context);
                            Future.delayed(const Duration(seconds: 5), () {
                              setState(() {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Main()),
                                );
                              });
                            });*/
                          },
                        ),
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
              }
            },
          ),
        ],
        /*leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),*/
        title: Text(
          'Progress',
          style:
          TextStyle(fontFamily: 'Manrope', fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Card(
                elevation: 0,
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('images/Colors/color2.jpg'),
                          fit: BoxFit.fitWidth
                      )
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      ListTile(
                        leading: Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Icon(Icons.crop_square, color: Colors.white, size: 50),
                        ),
                        title: Padding(
                          padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                          child: Text('Tile count:\n$tileNum', style: TextStyle(fontSize: 30, fontFamily: 'Manrope', fontWeight: FontWeight.bold, color: Colors.white)),
                        ),
                        //subtitle: Text('$tileNum', style: TextStyle(fontSize: 30, color: Colors.white, fontFamily: 'Manrope', fontWeight: FontWeight.bold,)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Card(
                elevation: 0,
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('images/Colors/color3.jpg'),
                          fit: BoxFit.fitWidth
                      )
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      ListTile(
                        leading: Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Icon(Icons.timer, color: Colors.white, size: 50),
                        ),
                        title: Padding(
                          padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                          child: Text('Hours saved:\n${double.parse((hour).toStringAsFixed(2))}', style: TextStyle(fontSize: 30, fontFamily: 'Manrope', fontWeight: FontWeight.bold, color: Colors.white)),
                        ),
                        //subtitle: Text('$tileNum', style: TextStyle(fontSize: 30, color: Colors.white, fontFamily: 'Manrope', fontWeight: FontWeight.bold,)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Card(
                elevation: 0,
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('images/Colors/color8.jpg'),
                          fit: BoxFit.fitWidth
                      )
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      ListTile(
                        leading: Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Icon(Icons.sentiment_satisfied, color: Colors.white, size: 50),
                        ),
                        title: Padding(
                          padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                          child: Text('Shirts donated:\n$donations', style: TextStyle(fontSize: 30, fontFamily: 'Manrope', fontWeight: FontWeight.bold, color: Colors.white)),
                        ),
                        //subtitle: Text('$tileNum', style: TextStyle(fontSize: 30, color: Colors.white, fontFamily: 'Manrope', fontWeight: FontWeight.bold,)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

