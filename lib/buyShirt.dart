import 'package:flutter/material.dart';
import 'package:mi_card/intro.dart';
import 'package:mi_card/savedMosaics.dart';
import 'package:url_launcher/url_launcher.dart';

class BuyShirt extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<BuyShirt> {
  _launchURL(String toMailId, String subject, String body) async {
    var url = 'mailto:$toMailId?subject=$subject&body=$body';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _name, _shirtsize, _address;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            'Order your shirt',
            style:
                TextStyle(fontFamily: 'OpenSans', fontWeight: FontWeight.bold),
          ),
        ),
        body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Name',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontFamily: 'OpenSans',
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 6.0,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        height: 50.0,
                        child: TextFormField(
                          keyboardType: TextInputType.multiline,
                          obscureText: false,
                          style: TextStyle(
                              color: Colors.black, fontFamily: 'OpenSans'),
                          validator: (input) {
                            if (input.isEmpty) {
                              return 'Provide your name';
                            }
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.only(top: 20.0),
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.black,
                            ),
                            hintText: 'Enter name',
                          ),
                          onSaved: (input) => _name = input,
                        ),
                      ),
                      SizedBox(
                        height: 3.0,
                      ),
                      Text('Shirt size',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontFamily: 'OpenSans',
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20)),
                      SizedBox(
                        height: 6.0,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        height: 50.0,
                        child: TextFormField(
                          keyboardType: TextInputType.multiline,
                          style: TextStyle(
                              color: Colors.black, fontFamily: 'OpenSans'),
                          validator: (input) {
                            if (input.isEmpty) {
                              return 'Provide your shirt size';
                            }
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.only(top: 20.0),
                            prefixIcon: Icon(
                              Icons.face,
                              color: Colors.black,
                            ),
                            hintText: 'Enter size',
                          ),
                          onSaved: (input) => _shirtsize = input,
                          obscureText: false,
                        ),
                      ),
                      SizedBox(
                        height: 3.0,
                      ),
                      Text('Address',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontFamily: 'OpenSans',
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 6.0,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        height: 50.0,
                        child: TextFormField(
                          keyboardType: TextInputType.multiline,
                          obscureText: false,
                          style: TextStyle(
                              color: Colors.black, fontFamily: 'OpenSans'),
                          validator: (input) {
                            if (input.isEmpty) {
                              return 'Provide your address';
                            }
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.only(top: 20.0),
                            prefixIcon: Icon(
                              Icons.home,
                              color: Colors.black,
                            ),
                            hintText: 'Enter address',
                          ),
                          onSaved: (input) => _address = input,
                        ),
                      ),
                      SizedBox(
                        height: 6.0,
                      ),
                      /*Text('Address',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontFamily: 'OpenSans',
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 6.0,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        height: 50.0,
                        child: TextFormField(
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          obscureText: false,
                          style: TextStyle(
                              color: Colors.black, fontFamily: 'OpenSans'),
                          validator: (input) {
                            if (input.isEmpty) {
                              return 'Provide your home address';
                            }
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.only(top: 20.0),
                            prefixIcon: Icon(
                              Icons.home,
                              color: Colors.black,
                            ),
                            hintText: 'Enter address',
                          ),
                          onSaved: (input) => _address = input,
                        ),
                      ),
                      SizedBox(
                        height: 6.0,
                      ),*/
                      Align(
                        alignment: Alignment.center,
                        child: RaisedButton(
                            elevation: 3.0,
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  // return object of type Dialog
                                  return AlertDialog(
                                    title: new Text(
                                      "Send email",
                                      style: TextStyle(
                                          fontFamily: 'OpenSans',
                                          fontWeight: FontWeight.bold),
                                    ),
                                    content: new Text(
                                      "Press send on the automatically created email to officially order your shirt",
                                      style: TextStyle(
                                          fontFamily: 'OpenSans',
                                          fontWeight: FontWeight.normal),
                                    ),
                                    actions: <Widget>[
                                      // usually buttons at the bottom of the dialog
                                      new FlatButton(
                                        child: new Text("OK",
                                            style: TextStyle(
                                                fontFamily: 'OpenSans',
                                                fontWeight: FontWeight.bold)),
                                        onPressed: () {
                                          final formState =
                                              _formKey.currentState;
                                          if (formState.validate()) {
                                            formState.save();
                                            _launchURL(
                                                'srijan.satpathy@gmail.com',
                                                'Shirt Order',
                                                "Name: $_name \nSize: $_shirtsize \nAddress: $_address \nID: $id \nImage: $imageName.png");
                                            Navigator.of(context).pop();
                                          }
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            padding: EdgeInsets.symmetric(),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            color: Colors.blue,
                            child: Text('ORDER',
                                style: TextStyle(
                                  color: Colors.black,
                                  letterSpacing: 1.5,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'OpenSans',
                                ))),
                      )
                    ]),
              ),
            )));
  }
}
