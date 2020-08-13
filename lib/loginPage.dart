import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mi_card/dashboard.dart';
import 'package:mi_card/forgotpassword.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email, _password;

  /*
  Future<bool> _onBackPressed() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(
                "Would you like to exit the app?",
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontFamily: 'Manrope'),
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text("No",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontFamily: 'Manrope')),
                  onPressed: () => Navigator.pop(context, false),
                ),
                FlatButton(
                  child: Text("Yes",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontFamily: 'Manrope')),
                  onPressed: () => Navigator.pop(context, true),
                )
              ],
            ));
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
            backgroundColor: Colors.black,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PassPage(),
                  ));
            },
            label: Text(
              'Forgot password?',
              style: TextStyle(
                  fontFamily: 'Manrope', fontWeight: FontWeight.bold),
            )),
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            'SIGN IN',
            style:
                TextStyle(fontFamily: 'Manrope', fontWeight: FontWeight.bold),
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
                      fontFamily: 'Manrope',
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
                  style: TextStyle(color: Colors.black, fontFamily: 'Manrope'),
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
                      fontFamily: 'Manrope',
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
                  style: TextStyle(color: Colors.black, fontFamily: 'Manrope'),
                  validator: (input) {
                    if (input.length < 6) {
                      return 'Longer password please';
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
                    onPressed: signIn,
                    padding: EdgeInsets.symmetric(),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    color: Colors.grey,
                    child: Text('LOGIN',
                        style: TextStyle(
                          color: Colors.black,
                          letterSpacing: 1.5,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Manrope',
                        ))),
              ),
            ])));
  }

  void signIn() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      try {
        FirebaseUser user = (await FirebaseAuth.instance
                .signInWithEmailAndPassword(email: _email, password: _password))
            .user;
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('email', 'useremail@gmail.com');
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Dashb(user: user),
                fullscreenDialog: true));
      } catch (e) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            // return object of type Dialog
            return AlertDialog(
              content: new Text('Please check your email or password.',
                  style: TextStyle(
                      fontFamily: 'Manrope', fontWeight: FontWeight.bold)),
              actions: <Widget>[
                // usually buttons at the bottom of the dialog
                new FlatButton(
                  child: new Text("OK",
                      style: TextStyle(
                          fontFamily: 'Manrope', fontWeight: FontWeight.bold)),
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
  }
}
