import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mi_card/loginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email, _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            'REGISTER',
            style:
                TextStyle(fontFamily: 'OpenSans', fontWeight: FontWeight.bold),
          ),
        ),
        body: Form(
            key: _formKey,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                    Widget>[
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
                  style: TextStyle(color: Colors.black, fontFamily: 'OpenSans'),
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
              Text('Password',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontFamily: 'OpenSans',
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 23)),
              SizedBox(
                height: 5.0,
              ),
              Container(
                alignment: Alignment.centerLeft,
                height: 50.0,
                child: TextFormField(
                  style: TextStyle(color: Colors.black, fontFamily: 'OpenSans'),
                  validator: (input) {
                    if (input.length < 6) {
                      return 'Must be at least six characters';
                    }
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.only(top: 20.0),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.black,
                    ),
                    hintText: 'Enter password',
                  ),
                  onSaved: (input) => _password = input,
                  obscureText: true,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: RaisedButton(
                    elevation: 3.0,
                    onPressed: () async {
                      final formState = _formKey.currentState;
                      if (formState.validate()) {
                        formState.save();
                        try {
                          FirebaseUser user = (await FirebaseAuth.instance
                                  .createUserWithEmailAndPassword(
                                      email: _email, password: _password))
                              .user;
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          prefs.setString('email', 'useremail@gmail.com');
                          user.sendEmailVerification();
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              // return object of type Dialog
                              return AlertDialog(
                                title: new Text(
                                  "Verification",
                                  style: TextStyle(
                                      fontFamily: 'OpenSans',
                                      fontWeight: FontWeight.bold),
                                ),
                                content: new Text(
                                  "Please check your email for the verification link, then proceed to sign in.",
                                  style: TextStyle(
                                      fontFamily: 'OpenSans',
                                      fontWeight: FontWeight.bold),
                                ),
                                actions: <Widget>[
                                  // usually buttons at the bottom of the dialog
                                  new FlatButton(
                                    child: new Text("OK",
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
                          Navigator.of(context).pop();
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()));
                        } catch (e) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              // return object of type Dialog
                              return AlertDialog(
                                content: new Text(e.message,
                                    style: TextStyle(
                                        fontFamily: 'OpenSans',
                                        fontWeight: FontWeight.bold)),
                                actions: <Widget>[
                                  // usually buttons at the bottom of the dialog
                                  new FlatButton(
                                    child: new Text("OK",
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
                        }
                      }
                    },
                    padding: EdgeInsets.symmetric(),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    color: Colors.grey,
                    child: Text('SIGN UP',
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
}
/*
  Future<void> signUp() async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        FirebaseUser user = (await FirebaseAuth.instance
                .createUserWithEmailAndPassword(
                    email: _email, password: _password))
            .user;
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('email', 'useremail@gmail.com');
        user.sendEmailVerification();
        Navigator.of(context).pop();
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      } catch (e) {
        print(e.message);
      }
    }
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Verification"),
          content: new Text(
              "Please check your email for the verification link, then proceed to sign in."),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
                signUp();
              },
            ),
          ],
        );
      },
    );
  }
}
*/
