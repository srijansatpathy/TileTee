import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mi_card/loading2guest.dart';
import 'package:mi_card/mainWelcome.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mi_card/main.dart';
import 'package:intl/intl.dart';

int counter;
int tileNum;
double hour;

/*class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
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
                _done ? 'Finished!' : 'LEVEL ONE',
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
                      MaterialPageRoute(builder: (context) => Grid1()),
                    );
                    strCurPage = 'page4';
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setString('stringValue', strCurPage);
                    print('4 hello!');
                  },
                  duration: Duration(minutes: 5),
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

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (now == null){
      now = DateTime.now();
    }
    DateTime five = now.add(Duration(minutes: 12));
    String formattedDateHr = DateFormat('hh:mm').format(five);
    String formattedDateSec = DateFormat('ss').format(five);
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
                    if (DateTime.now().isAfter(five) || DateTime.now().isAtSameMomentAs(five)){
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Main()),
                      );
                      now = null;
                      counter = 0;
                      SharedPreferences prefs1 =
                      await SharedPreferences.getInstance();
                      prefs1.setInt('pressedNum', counter);

                      hour += 0.2;
                      SharedPreferences _prefs1 =
                      await SharedPreferences.getInstance();
                      _prefs1.setDouble('timeSaved', hour);

                      tileNum += 1;
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
              title: Text('LEVEL ONE', style: TextStyle(fontFamily: 'Manrope', fontWeight: FontWeight.bold),),backgroundColor: Colors.black,
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
                        if (DateTime.now().isAfter(five) || DateTime.now().isAtSameMomentAs(five)){
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
                                        timestamp = DateTime.now().millisecondsSinceEpoch;
                                        timestamp += 7000;
                                        SharedPreferences prefs2 = await SharedPreferences.getInstance();
                                        prefs2.setInt('myTimestampKey', timestamp);

                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(builder: (context) => Splash2()),
                                        );
                                        now = null;
                                        counter = 0;
                                        SharedPreferences prefs1 =
                                        await SharedPreferences.getInstance();
                                        prefs1.setInt('pressedNum', counter);

                                        hour += 0.2;
                                        SharedPreferences _prefs1 =
                                        await SharedPreferences.getInstance();
                                        _prefs1.setDouble('timeSaved', hour);

                                        tileNum += 1;
                                        SharedPreferences _prefs =
                                        await SharedPreferences.getInstance();
                                        _prefs.setInt('tiles', tileNum);

                                        strCurPage = 'page6';
                                        SharedPreferences prefs =
                                            await SharedPreferences.getInstance();
                                        prefs.setString('stringValue', strCurPage);
                                        print('6 hello!');
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                          else{
                            timestamp = DateTime.now().millisecondsSinceEpoch;
                            timestamp += 7000;
                            SharedPreferences prefs2 = await SharedPreferences.getInstance();
                            prefs2.setInt('myTimestampKey', timestamp);

                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => Splash2()),
                            );
                            now = null;
                            counter = 0;
                            SharedPreferences prefs1 =
                            await SharedPreferences.getInstance();
                            prefs1.setInt('pressedNum', counter);

                            hour += 0.2;
                            SharedPreferences _prefs1 =
                            await SharedPreferences.getInstance();
                            _prefs1.setDouble('timeSaved', hour);

                            tileNum += 1;
                            SharedPreferences _prefs =
                            await SharedPreferences.getInstance();
                            _prefs.setInt('tiles', tileNum);

                            strCurPage = 'page6';
                            SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                            prefs.setString('stringValue', strCurPage);
                            print('6 hello!');
                          }
                        }
                        else{
                          counter += 1;
                          SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                          prefs.setInt('pressedNum', counter);
                        }
                      },
                      label: Text('Proceed', style: TextStyle(fontFamily: 'Manrope', fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25.0),),
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
