import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mi_card/guestGrid1.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mi_card/main.dart';
import 'package:intl/intl.dart';

var counter;

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
                    fontFamily: 'OpenSans', fontWeight: FontWeight.bold),
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
                      style: TextStyle(fontSize: 50, fontFamily: 'OpenSans'),
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
    DateTime five = now.add(Duration(minutes: 5));
    String formattedDateHr = DateFormat('hh:mm').format(five);
    String formattedDateSec = DateFormat('ss').format(five);
    return WillPopScope(
      onWillPop: () async => false,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: Text('LEVEL ONE', style: TextStyle(fontFamily: 'OpenSans', fontWeight: FontWeight.bold),),backgroundColor: Colors.black,
            ),
            body: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 130.0),
                  child: Center(child: Text('Level ends at',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30.0, fontFamily: 'OpenSans', color: Colors.black
                  ),)),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  mainAxisAlignment: MainAxisAlignment.center,
                  textBaseline: TextBaseline.ideographic,
                  children: <Widget>[
                    Center(child: Text(formattedDateHr+'  ',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40.0, fontFamily: 'OpenSans', color: Colors.black
                    ),)),
                    Center(child: Text(formattedDateSec,textAlign: TextAlign.center,style: TextStyle(fontSize: 30.0, fontFamily: 'OpenSans', color: Colors.black
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
                                          fontFamily: 'OpenSans',
                                          fontWeight: FontWeight.bold)),
                                  actions: <Widget>[
                                    new FlatButton(
                                      child: new Text("OK",
                                          style: TextStyle(
                                              fontFamily: 'OpenSans',
                                              fontWeight: FontWeight.bold)),
                                      onPressed: () async{
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(builder: (context) => Grid1()),
                                        );
                                        now = null;
                                        counter = 0;
                                        SharedPreferences prefs1 =
                                        await SharedPreferences.getInstance();
                                        prefs1.setInt('pressedNum', counter);

                                        strCurPage = 'page4';
                                        SharedPreferences prefs =
                                            await SharedPreferences.getInstance();
                                        prefs.setString('stringValue', strCurPage);
                                        print('4 hello!');
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
                              MaterialPageRoute(builder: (context) => Grid1()),
                            );
                            now = null;
                            counter = 0;
                            SharedPreferences prefs1 =
                            await SharedPreferences.getInstance();
                            prefs1.setInt('pressedNum', counter);

                            strCurPage = 'page4';
                            SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                            prefs.setString('stringValue', strCurPage);
                            print('4 hello!');
                          }
                        }
                        else{
                          counter += 1;
                          SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                          prefs.setInt('pressedNum', counter);
                        }
                      },
                      label: Text('Proceed', style: TextStyle(fontFamily: 'OpenSans', fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25.0),),
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
