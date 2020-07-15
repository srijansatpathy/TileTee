import 'package:flutter/material.dart';
import 'package:mi_card/intro.dart';
import 'package:url_launcher/url_launcher.dart';

class FeedbackPage extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<FeedbackPage> {
  _launchURL(String toMailId, String subject, String body) async {
    var url = 'mailto:$toMailId?subject=$subject&body=$body';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _feedback;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            'Send Feedback',
            style:
                TextStyle(fontFamily: 'OpenSans', fontWeight: FontWeight.bold),
          ),
        ),
        body: Align(
          alignment: Alignment.center,
          child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Thoughts/comments/suggestions:',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontFamily: 'OpenSans',
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 8.0,
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
                                return 'Provide feedback';
                              }
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.only(top: 20.0),
                              prefixIcon: Icon(
                                Icons.feedback,
                                color: Colors.black,
                              ),
                              hintText: 'Write feedback',
                            ),
                            onSaved: (input) => _feedback = input,
                          ),
                        ),
                        SizedBox(
                          height: 6.0,
                        ),
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
                                        "Press send on the automatically created email to record your feedback",
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
                                                  'App Feedback',
                                                  "Feedback: $_feedback \nID: $id");
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
                              child: Text('SEND',
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
              )),
        ));
  }
}
