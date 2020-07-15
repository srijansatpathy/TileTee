import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'dashboard.dart';

@optionalTypeArgs
Future<T> push<T extends Object>(BuildContext context, Route<T> route) {
  return Navigator.of(context).push(route);
}

class LoginRegister extends StatefulWidget {
  @override
  _LoginRegisterState createState() => _LoginRegisterState();
}

bool _rememberMe = false;

Widget _buildSignInWithText() {
  return Column(children: <Widget>[
    Text(
      'SIGN IN',
      style: TextStyle(
        color: Colors.black,
        fontFamily: 'AbrilFatface',
        fontSize: 50.0,
        fontWeight: FontWeight.bold,
      ),
    ),
  ]);
}

Widget _buildEmail() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text('Email',
          style: TextStyle(
              fontFamily: 'OpenSans', color: Colors.black, fontSize: 20)),
      SizedBox(
        height: 10.0,
      ),
      Container(
          alignment: Alignment.centerLeft,
          //decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
              obscureText: false,
              style: TextStyle(color: Colors.black, fontFamily: 'OpenSans'),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.black,
                ),
                hintText: 'Enter email',
                //hintStyle: kHintTextStyle,
              ))),
    ],
  );
}

Widget _buildPassword() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text('Password',
          style: TextStyle(
              fontFamily: 'OpenSans', color: Colors.black, fontSize: 20)),
      SizedBox(
        height: 10.0,
      ),
      Container(
          alignment: Alignment.centerLeft,
          //decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
              obscureText: true,
              style: TextStyle(color: Colors.black, fontFamily: 'OpenSans'),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.black,
                ),
                hintText: 'Enter password',
                //hintStyle: kHintTextStyle,
              )))
    ],
  );
}

Widget _buildForgotPassword() {
  return Container(
    alignment: Alignment.centerRight,
    child: FlatButton(
        onPressed: () => print('Forgot Password Button Pressed'),
        child: Text('Forgot password?',
            style: TextStyle(
                color: Colors.black, fontSize: 15, fontFamily: 'OpenSans'))),
  );
}

class _LoginRegisterState extends State<LoginRegister> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  PersistentBottomSheetController _sheetController;
  String _email;
  String _password;
  String _displayName;
  bool _loading = false;
  bool _autoValidate = false;
  String errorMsg = "";

  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
          elevation: 3.0,
          onPressed: signIn,
          padding: EdgeInsets.all(15.0),
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
                fontFamily: 'OpenSans',
              ))),
    );
  }

  Widget _build_OR_SignIn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          '- OR -',
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontFamily: 'OpenSans'),
        ),
        SizedBox(
          height: 20.0,
        ),
        Text('Sign in with',
            style: TextStyle(
                color: Colors.black, fontSize: 15.0, fontFamily: 'OpenSans'))
      ],
    );
  }

  Widget _build_SocialBtn(Function onTap, AssetImage logo) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0, 2),
                  blurRadius: 4.0,
                ),
              ],
              image: DecorationImage(
                image: logo,
              ),
            )));
  }

  Widget _buildSocialBtnRow() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _build_SocialBtn(
            () => print('Login in with Google'),

            /*() => authService.googleSignIn().whenComplete() {
 Navigator.pushReplacementNamed(context, '/');
 },*/
            AssetImage('images/google.png'),
          ),
          _build_SocialBtn(
            /* () => authService.facebookSignIn().whenComplete() {
 Navigator.pushReplacementNamed(context, '/');
 },*/
            () => print('Login in with Facebook'),
            AssetImage('images/facebook.png'),
          ),
        ],
      ),
    );
  }

  Widget _buildSignUp() {
    return GestureDetector(
        onTap: () => print('Signup button pressed'),
        child: RichText(
            text: TextSpan(
          children: [
            TextSpan(
              text: 'Don\'t have an account?',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.00,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'OpenSans'),
            ),
            TextSpan(
              text: ' Sign up',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.00,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'OpenSans'),
            ),
          ],
        )));
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.black,
            title: Title(
              color: Colors.black,
              child: Text("CAST"),
            )),
        body: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.white30,
            ),
            Container(
                height: double.infinity,
                child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                      horizontal: 40.0,
                      vertical: 80.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'SIGN IN',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'AbrilFatface',
                            fontSize: 50.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        _buildEmail(),
                        SizedBox(height: 20.0),
                        _buildPassword(),
                        _buildForgotPassword(),
                        _buildLoginBtn(),
                        _build_OR_SignIn(),
                        _buildSocialBtnRow(),
                        _buildSignUp()
                      ],
                    )))
          ],
        ));
  }

  Future<void> signIn() async {
    final Form = _formKey.currentState;
    if (Form.validate()) {
      Form.save();
      try {
        FirebaseUser user = (await FirebaseAuth.instance
                .signInWithEmailAndPassword(email: _email, password: _password))
            .user;
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => Dashb(user: user)));
        //TODO: Navigate to home
      } catch (e) {
        print(e.message);
      }
    }
    //TODO validate fields
  }
}
