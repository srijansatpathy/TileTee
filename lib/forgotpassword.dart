import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mi_card/loginPage.dart';

class PassPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<PassPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            'PASSWORD RESET',
            style:
                TextStyle(fontFamily: 'OpenSans', fontWeight: FontWeight.bold),
          ),
        ),
        body: Form(
            key: _formKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Email',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontFamily: 'OpenSans',
                          color: Colors.black,
                          fontSize: 23,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 5.0,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    height: 50.0,
                    child: TextFormField(
                      obscureText: false,
                      style: TextStyle(
                          color: Colors.black, fontFamily: 'OpenSans'),
                      validator: (input) {
                        if (input.isEmpty) {
                          return 'Provide an email';
                        }
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.only(top: 20.0),
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.black,
                        ),
                        hintText: 'Enter email',
                      ),
                      onSaved: (input) => _email = input.trim(),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: RaisedButton(
                        elevation: 3.0,
                        onPressed: _showDialog1,
                        padding: EdgeInsets.symmetric(),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        color: Colors.grey,
                        child: Text('RESET',
                            style: TextStyle(
                              color: Colors.black,
                              letterSpacing: 1.5,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'OpenSans',
                            ))),
                  )
                ])));
  }

  Future<void> sendPasswordResetEmail(String email) async {
    return FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

  void _showDialog1() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Reset",
              style: TextStyle(
                  fontFamily: 'OpenSans', fontWeight: FontWeight.bold)),
          content: new Text(
              "Please check your email for the reset link, then proceed to sign in.",
              style: TextStyle(
                  fontFamily: 'OpenSans', fontWeight: FontWeight.bold)),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("OK",
                  style: TextStyle(
                      fontFamily: 'OpenSans', fontWeight: FontWeight.bold)),
              onPressed: () async {
                Navigator.of(context).pop();
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  try {
                    sendPasswordResetEmail(_email);
                  } catch (e) {
                    print(e);
                  }
                }
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
            ),
          ],
        );
      },
    );
  }
}
