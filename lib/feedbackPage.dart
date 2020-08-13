import 'package:flutter/material.dart';
import 'package:mi_card/intro.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';


class FeedbackPage extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<FeedbackPage> {
  /*_launchURL(String toMailId, String subject, String body) async {
    var url = 'mailto:$toMailId?subject=$subject&body=$body';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }*/

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  String _feedback;

  Future<void> send() async {
    final Email email = Email(
      body: "Feedback: $_feedback \nAppID: $id",
      subject: 'App Feedback',
      recipients: ['srijan.satpathy@gmail.com'],
      isHTML: false,
    );

    String platformResponse;

    try {
      await FlutterEmailSender.send(email);
      platformResponse = 'Thank you';
    } catch (error) {
      platformResponse = error.toString();
    }

    if (!mounted) return;

    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(platformResponse, style: TextStyle(fontFamily: 'Manrope', fontWeight: FontWeight.bold),),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
        appBar: AppBar(
          /*leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),*/
          backgroundColor: Colors.black,
          title: Text(
            'Send Feedback',
            style:
                TextStyle(fontFamily: 'Manrope', fontWeight: FontWeight.bold),
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
                        Text('As the world sees a surge in screen time, we believe it is important to remind people of the possibilities that exist outside their devices. If you believe in our cause, help us improve this idea.\n\n-Team TileTee',
                        style: TextStyle(fontFamily: 'Manrope', fontStyle: FontStyle.italic, fontSize: 15.0),),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text('Thoughts/comments/suggestions:',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontFamily: 'Manrope',
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
                                color: Colors.black, fontFamily: 'Manrope'),
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
                                final formState =
                                    _formKey.currentState;
                                if (formState.validate()) {
                                  formState.save();
                                  send();
                                }
                                /*showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    // return object of type Dialog
                                    return AlertDialog(
                                      title: new Text(
                                        "Send email",
                                        style: TextStyle(
                                            fontFamily: 'Manrope',
                                            fontWeight: FontWeight.bold),
                                      ),
                                      content: new Text(
                                        "Press send on the automatically created email to record your feedback",
                                        style: TextStyle(
                                            fontFamily: 'Manrope',
                                            fontWeight: FontWeight.normal),
                                      ),
                                      actions: <Widget>[
                                        // usually buttons at the bottom of the dialog
                                        new FlatButton(
                                          child: new Text("OK",
                                              style: TextStyle(
                                                  fontFamily: 'Manrope',
                                                  fontWeight: FontWeight.bold)),
                                          onPressed: () {
                                            final formState =
                                                _formKey.currentState;
                                            if (formState.validate()) {
                                              formState.save();
                                              Navigator.of(context).pop();
                                              send();
                                            }
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );*/
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
                                    fontFamily: 'Manrope',
                                  ))),
                        ),
                      ]),
                ),
              )),
        ));
  }
}
