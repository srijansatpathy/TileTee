import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mi_card/main.dart';
import 'package:mi_card/mainWelcome.dart';
import 'package:mi_card/timer1guest.dart';
import 'package:shared_preferences/shared_preferences.dart';

/*class Launch8 extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Launch8> {
  var _done = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.black,
              title: Text(
                _done ? 'Finished!' : 'LEVEL EIGHT',
                style: TextStyle(
                    fontFamily: 'Manrope', fontWeight: FontWeight.bold),
              )),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Center(
                child: CountdownFormatted(
                  onFinish: () async {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Grid8()),
                    );
                    strCurPage = 'page25';
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setString('stringValue', strCurPage);
                    print('25 hello!');
                  },
                  duration: Duration(minutes: 40),
                  builder: (BuildContext ctx, String remaining) {
                    return Text(
                      remaining,
                      style: TextStyle(fontSize: 50, fontFamily: 'Manrope'),
                    ); // 01:00:00
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}*/

class Launch8 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (now == null){
      now = DateTime.now();
    }
    DateTime fort = now.add(Duration(minutes: 96));
    String formattedDateHr = DateFormat('hh:mm').format(fort);
    String formattedDateSec = DateFormat('ss').format(fort);
    return WillPopScope(
      onWillPop: () async => false,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                  size: 40.0,
                ),
                onPressed: () async{
                  if (DateTime.now().isAfter(fort) || DateTime.now().isAtSameMomentAs(fort)){
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Main()),
                    );
                    now = null;
                    counter = 0;
                    SharedPreferences prefs1 =
                    await SharedPreferences.getInstance();
                    prefs1.setInt('pressedNum', counter);

                    hour += 1.6;
                    SharedPreferences _prefs1 =
                    await SharedPreferences.getInstance();
                    _prefs1.setDouble('timeSaved', hour);

                    tileNum += 8;
                    SharedPreferences _prefs =
                    await SharedPreferences.getInstance();
                    _prefs.setInt('tiles', tileNum);

                    strCurPage = 'page1';
                    SharedPreferences prefs =
                    await SharedPreferences.getInstance();
                    prefs.setString('stringValue', strCurPage);
                    print('1 hello!');
                  }
                },
              )
            ],
            title: Text('LEVEL EIGHT', style: TextStyle(fontFamily: 'Manrope', fontWeight: FontWeight.bold),),backgroundColor: Colors.black,
          ),
          body: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 130.0),
                child: Center(child: Text('Level ends at',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30.0, fontFamily: 'Manrope', color: Colors.black
                ),)),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                mainAxisAlignment: MainAxisAlignment.center,
                textBaseline: TextBaseline.ideographic,
                children: <Widget>[
                  Center(child: Text(formattedDateHr+'  ',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40.0, fontFamily: 'Manrope', color: Colors.black
                  ),)),
                  Center(child: Text(formattedDateSec,textAlign: TextAlign.center,style: TextStyle(fontSize: 30.0, fontFamily: 'Manrope', color: Colors.black
                  ),)),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 50.0),
                  child: FloatingActionButton.extended(
                    backgroundColor: Colors.blue,
                    onPressed: ()async{
                      if (DateTime.now().isAfter(fort) || DateTime.now().isAtSameMomentAs(fort)){
                        if (counter > 0){
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              // return object of type Dialog
                              return AlertDialog(
                                content: new Text(
                                    "You pressed 'Proceed' prematurely ${counter} times. Relax.",
                                    style: TextStyle(
                                        fontFamily: 'Manrope',
                                        fontWeight: FontWeight.bold)),
                                actions: <Widget>[
                                  new FlatButton(
                                    child: new Text("OK",
                                        style: TextStyle(
                                            fontFamily: 'Manrope',
                                            fontWeight: FontWeight.bold)),
                                    onPressed: () async{
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(builder: (context) => Main()),
                                      );
                                      now = null;
                                      counter = 0;
                                      SharedPreferences prefs1 =
                                      await SharedPreferences.getInstance();
                                      prefs1.setInt('pressedNum', counter);

                                      hour += 1.6;
                                      SharedPreferences _prefs1 =
                                      await SharedPreferences.getInstance();
                                      _prefs1.setDouble('timeSaved', hour);

                                      tileNum += 8;
                                      SharedPreferences _prefs =
                                      await SharedPreferences.getInstance();
                                      _prefs.setInt('tiles', tileNum);

                                      strCurPage = 'page1';
                                      SharedPreferences prefs =
                                      await SharedPreferences.getInstance();
                                      prefs.setString('stringValue', strCurPage);
                                      print('1 hello!');
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        }
                        else{
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => Main()),
                          );
                          now = null;
                          counter = 0;
                          SharedPreferences prefs1 =
                          await SharedPreferences.getInstance();
                          prefs1.setInt('pressedNum', counter);

                          hour += 1.6;
                          SharedPreferences _prefs1 =
                          await SharedPreferences.getInstance();
                          _prefs1.setDouble('timeSaved', hour);

                          tileNum += 8;
                          SharedPreferences _prefs =
                          await SharedPreferences.getInstance();
                          _prefs.setInt('tiles', tileNum);

                          strCurPage = 'page1';
                          SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                          prefs.setString('stringValue', strCurPage);
                          print('1 hello!');
                        }
                      }
                      else{
                        counter += 1;
                        SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                        prefs.setInt('pressedNum', counter);
                      }
                    },
                    label: Text('Finish', style: TextStyle(fontFamily: 'Manrope', fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25.0),),
                    icon: Icon(Icons.navigate_next, color: Colors.black,),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}