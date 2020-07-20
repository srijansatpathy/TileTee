import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:countdown_flutter/countdown_flutter.dart';
import 'package:mi_card/guestGrid5.dart';
import 'package:mi_card/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Launch5 extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Launch5> {
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
                _done ? 'Finished!' : 'LEVEL FIVE',
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
                      MaterialPageRoute(builder: (context) => Grid5()),
                    );
                    strCurPage = 'page16';
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setString('stringValue', strCurPage);
                    print('16 hello!');
                  },
                  duration: Duration(seconds: 2),
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
}
