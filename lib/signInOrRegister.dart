import 'package:flutter/material.dart';
import 'package:mi_card/loginPage.dart';
import 'package:mi_card/registerPage.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'CAST',
          style: TextStyle(fontFamily: 'Manrope', fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Card(
                color: Colors.grey,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: ListTile(
                    leading: Icon(Icons.person, color: Colors.black),
                    title: Text(
                      'SIGN IN',
                      style: TextStyle(
                          fontFamily: 'Manrope', fontWeight: FontWeight.bold),
                    ),
                    onTap: navigateSignIn)),
            Card(
                color: Colors.grey,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: ListTile(
                    leading: Icon(Icons.person_add, color: Colors.black),
                    title: Text(
                      'REGISTER',
                      style: TextStyle(
                          fontFamily: 'Manrope', fontWeight: FontWeight.bold),
                    ),
                    onTap: navigateSignUp)),
          ],
        ),
      ),
    );
  }

  void navigateSignIn() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => LoginPage(), fullscreenDialog: true));
  }

  void navigateSignUp() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SignUpPage(), fullscreenDialog: true));
  }
}
