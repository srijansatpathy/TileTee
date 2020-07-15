import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/dot_animation_enum.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:mi_card/isSignedIn.dart';
import 'package:mi_card/mainWelcome.dart';
import 'package:shared_preferences/shared_preferences.dart';

var id;

class IntroScreen extends StatefulWidget {
  IntroScreen({Key key}) : super(key: key);

  @override
  IntroScreenState createState() => new IntroScreenState();
}

class IntroScreenState extends State<IntroScreen> {
  String _email, _password;

  static const _chars = 'abcdefghijklmnopqrstuvwxyz1234567890';
  Random _rnd = Random.secure();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  List<Slide> slides = new List();

  Function goToTab;

  @override
  void initState() {
    super.initState();

    /*slides.add(
      new Slide(
        title: "Welcome to Craftime",
        styleTitle: TextStyle(
            color: Colors.black,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans'),
        description: "Reducing screen time one mosaic at a time",
        styleDescription: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans'),
        pathImage: "images/mosaic.png", //Mosaic image
      ),
    );*/
    slides.add(
      new Slide(
        title: "Spend less screen time and build mosaics",
        styleTitle: TextStyle(
            color: Colors.black,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            fontFamily: 'OpenSans'),
        description:
            "", //"Save mosaics along the way and view after run-throughs",
        styleDescription: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans'),
        pathImage: "images/mosaic2.png", //Gif of me pressing Save Mosaic
      ),
    );
    slides.add(
      new Slide(
        title: "Put your phone down when the timer starts",
        styleTitle: TextStyle(
            color: Colors.black,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            fontFamily: 'OpenSans'),
        description:
            "", //"Experience and better the real world, don't like and comment",
        styleDescription: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans'),
        pathImage: "images/time.png", //Gif of timer starting
      ),
    );
    slides.add(
      new Slide(
        title: "Do what you love without your phone",
        styleTitle: TextStyle(
            color: Colors.black,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            fontFamily: 'OpenSans'),
        description:
            "", //"Build mosaics that get bigger with each level, which means more complex designs",
        styleDescription: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans'),
        pathImage: "images/heart.png", //Mosaic image
      ),
    );
    /*slides.add(
      new Slide(
        title: "Mosaic Builder is unstoppable",
        styleTitle: TextStyle(
            color: Colors.black,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans'),
        description:
            "Run-throughs can't be exited unless you decide to quit and start over",
        styleDescription: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans'),
        pathImage: "images/quit.jpg", //Image of app exit dialog
      ),
    );*/
    slides.add(
      new Slide(
        title: "Wear your hard-earned mosaic on a sleek shirt",
        styleTitle: TextStyle(
            color: Colors.black,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            fontFamily: 'OpenSans'),
        description:
            "", //"Show the world what's possible when you spend less time surfing and scrolling",
        styleDescription: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans'),
        pathImage: "images/shirt2.png", //Image of shirt
      ),
    );
  }

  // replace this function with the examples above
  showAlertDialog(BuildContext context) {
    // set up the list options
    Widget optionOne = SimpleDialogOption(
      child: const Text(
        '(A) Music',
        style: TextStyle(fontFamily: 'OpenSans'),
      ),
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: new Text('Play on.',
                  style: TextStyle(
                      fontFamily: 'OpenSans', fontWeight: FontWeight.bold)),
              content: new Text(
                  'Why stare at a screen when you can live and breathe music?',
                  style: TextStyle(fontFamily: 'OpenSans')),
              actions: <Widget>[
                new FlatButton(
                  child: new Text("BACK",
                      style: TextStyle(
                          fontFamily: 'OpenSans', fontWeight: FontWeight.bold)),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                // usually buttons at the bottom of the dialog
                new FlatButton(
                  child: new Text("LET'S BEGIN",
                      style: TextStyle(
                          fontFamily: 'OpenSans', fontWeight: FontWeight.bold)),
                  onPressed: () {
                    onDonePress();
                  },
                ),
              ],
            );
          },
        );
      },
    );
    Widget optionTwo = SimpleDialogOption(
      child: const Text(
        '(B) Reading',
        style: TextStyle(fontFamily: 'OpenSans'),
      ),
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: new Text('Read on.',
                  style: TextStyle(
                      fontFamily: 'OpenSans', fontWeight: FontWeight.bold)),
              content: new Text(
                  'Why stare at a screen when you can absorb pages full of imagination?',
                  style: TextStyle(fontFamily: 'OpenSans')),
              actions: <Widget>[
                new FlatButton(
                  child: new Text("BACK",
                      style: TextStyle(
                          fontFamily: 'OpenSans', fontWeight: FontWeight.bold)),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                // usually buttons at the bottom of the dialog
                new FlatButton(
                  child: new Text("LET'S BEGIN",
                      style: TextStyle(
                          fontFamily: 'OpenSans', fontWeight: FontWeight.bold)),
                  onPressed: () {
                    onDonePress();
                  },
                ),
              ],
            );
          },
        );
      },
    );
    Widget optionThree = SimpleDialogOption(
      child: const Text(
        '(C) Travel',
        style: TextStyle(fontFamily: 'OpenSans'),
      ),
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: new Text('Explore on.',
                  style: TextStyle(
                      fontFamily: 'OpenSans', fontWeight: FontWeight.bold)),
              content: new Text(
                  'Why stare at a screen when you can experience the wonders of the real world?',
                  style: TextStyle(fontFamily: 'OpenSans')),
              actions: <Widget>[
                new FlatButton(
                  child: new Text("BACK",
                      style: TextStyle(
                          fontFamily: 'OpenSans', fontWeight: FontWeight.bold)),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                // usually buttons at the bottom of the dialog
                new FlatButton(
                  child: new Text("LET'S BEGIN",
                      style: TextStyle(
                          fontFamily: 'OpenSans', fontWeight: FontWeight.bold)),
                  onPressed: () {
                    onDonePress();
                  },
                ),
              ],
            );
          },
        );
      },
    );
    Widget optionFour = SimpleDialogOption(
      child: const Text(
        '(D) Sports',
        style: TextStyle(fontFamily: 'OpenSans'),
      ),
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: new Text('Play on.',
                  style: TextStyle(
                      fontFamily: 'OpenSans', fontWeight: FontWeight.bold)),
              content: new Text(
                  'Why stare at a screen when you can crush the competition while breaking out in a sweat?',
                  style: TextStyle(fontFamily: 'OpenSans')),
              actions: <Widget>[
                new FlatButton(
                  child: new Text("BACK",
                      style: TextStyle(
                          fontFamily: 'OpenSans', fontWeight: FontWeight.bold)),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                // usually buttons at the bottom of the dialog
                new FlatButton(
                  child: new Text("LET'S BEGIN",
                      style: TextStyle(
                          fontFamily: 'OpenSans', fontWeight: FontWeight.bold)),
                  onPressed: () {
                    onDonePress();
                  },
                ),
              ],
            );
          },
        );
      },
    );
    Widget optionFive = SimpleDialogOption(
      child: const Text(
        '(E) Other',
        style: TextStyle(fontFamily: 'OpenSans'),
      ),
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: new Text('Right on.',
                  style: TextStyle(
                      fontFamily: 'OpenSans', fontWeight: FontWeight.bold)),
              content: new Text(
                  'Why stare at a screen when you can do what you truly love?',
                  style: TextStyle(fontFamily: 'OpenSans')),
              actions: <Widget>[
                new FlatButton(
                  child: new Text("BACK",
                      style: TextStyle(
                          fontFamily: 'OpenSans', fontWeight: FontWeight.bold)),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                // usually buttons at the bottom of the dialog
                new FlatButton(
                  child: new Text("LET'S BEGIN",
                      style: TextStyle(
                          fontFamily: 'OpenSans', fontWeight: FontWeight.bold)),
                  onPressed: () {
                    onDonePress();
                  },
                ),
              ],
            );
          },
        );
      },
    );
    Widget optionSix = SimpleDialogOption(
      child: const Text(
        '(F) Smartphone scrolling',
        style: TextStyle(fontFamily: 'OpenSans'),
      ),
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: new Text("Well, you're in the right place.",
                  style: TextStyle(
                      fontFamily: 'OpenSans', fontWeight: FontWeight.bold)),
              content: new Text(
                  'Why stare at a screen when you could build some mosaics?',
                  style: TextStyle(fontFamily: 'OpenSans')),
              actions: <Widget>[
                new FlatButton(
                  child: new Text("BACK",
                      style: TextStyle(
                          fontFamily: 'OpenSans', fontWeight: FontWeight.bold)),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                // usually buttons at the bottom of the dialog
                new FlatButton(
                  child: new Text("LET'S BEGIN",
                      style: TextStyle(
                          fontFamily: 'OpenSans', fontWeight: FontWeight.bold)),
                  onPressed: () {
                    onDonePress();
                  },
                ),
              ],
            );
          },
        );
      },
    );

    // set up the SimpleDialog
    SimpleDialog dialog = SimpleDialog(
      title: const Text(
        "Select your favorite hobby/interest:",
        style: TextStyle(fontFamily: 'OpenSans', fontWeight: FontWeight.bold),
      ),
      children: <Widget>[
        optionOne,
        optionTwo,
        optionThree,
        optionFour,
        optionFive,
        optionSix
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return dialog;
      },
    );
  }

  void onDonePress() async {
    _email = (getRandomString(6) + '@random.com').trim();
    _password = getRandomString(6).trim();
    print(_email);
    print(_password);
    try {
      FirebaseUser user = (await FirebaseAuth.instance
              .createUserWithEmailAndPassword(
                  email: _email, password: _password))
          .user;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('email', 'useremail@random.com');
      id = user.email;
    } catch (e) {
      _email = (getRandomString(6) + '@random.com').trim();
      FirebaseUser user = (await FirebaseAuth.instance
              .createUserWithEmailAndPassword(
                  email: _email, password: _password))
          .user;
      id = user.email;
    }
    /*try {
      FirebaseUser user = (await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: _email, password: _password))
          .user;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('email', 'useremail@random.com');
    } catch (e) {}*/
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Main(), fullscreenDialog: true),
    );
    strCurPage = 'page1';
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('stringValue', strCurPage);
    print('1 hello!');
  }

  void onTabChangeCompleted(index) {
    // Index of current tab is focused
  }

  Widget renderNextBtn() {
    return Icon(
      Icons.navigate_next,
      color: Colors.white,
      size: 30.0,
    );
  }

  Widget renderDoneBtn() {
    return Icon(
      Icons.arrow_forward,
      color: Colors.white,
      size: 30.0,
    );
  }

  Widget renderSkipBtn() {
    return Icon(
      Icons.skip_next,
      color: Colors.white,
      size: 30.0,
    );
  }

  List<Widget> renderListCustomTabs() {
    List<Widget> tabs = new List();
    for (int i = 0; i < slides.length; i++) {
      Slide currentSlide = slides[i];
      tabs.add(WillPopScope(
        onWillPop: () async => false,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Container(
            margin: EdgeInsets.only(bottom: 30.0, top: 50.0),
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 70.0),
                  child: GestureDetector(
                      child: Image.asset(
                    currentSlide.pathImage,
                    width: 210.0,
                    height: 210.0,
                    fit: BoxFit.contain,
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40),
                  child: SizedBox(
                    height: 12,
                    width: 240,
                    child: Divider(
                      color: Colors.black,
                      thickness: 1,
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    currentSlide.title,
                    style: currentSlide.styleTitle,
                    textAlign: TextAlign.center,
                  ),
                  margin: EdgeInsets.only(top: 0.0, left: 15, right: 15),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40),
                  child: SizedBox(
                    height: 20,
                    width: 240,
                    child: Divider(
                      color: Colors.black,
                      thickness: 1,
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    currentSlide.description,
                    style: currentSlide.styleDescription,
                    textAlign: TextAlign.center,
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                  ),
                  margin: EdgeInsets.only(top: 20.0, left: 15, right: 15),
                ),
              ],
            ),
          ),
        ),
      ));
    }
    return tabs;
  }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      // List slides
      slides: this.slides,

      // Skip button
      renderSkipBtn: this.renderSkipBtn(),
      colorSkipBtn: Colors.blue,
      highlightColorSkipBtn: Colors.black,

      // Next button
      renderNextBtn: this.renderNextBtn(),

      // Done button
      renderDoneBtn: this.renderDoneBtn(),
      onDonePress: () {
        showAlertDialog(context);
      },
      colorDoneBtn: Colors.blue,
      highlightColorDoneBtn: Colors.black,

      // Dot indicator
      colorDot: Colors.black,
      sizeDot: 10.0,
      typeDotAnimation: dotSliderAnimation.SIZE_TRANSITION,

      // Tabs
      listCustomTabs: this.renderListCustomTabs(),
      backgroundColorAllSlides: Colors.white,
      refFuncGoToTab: (refFunc) {
        this.goToTab = refFunc;
      },

      // Show or hide status bar
      shouldHideStatusBar: false,

      // On tab change completed
      onTabChangeCompleted: this.onTabChangeCompleted,
    );
  }
}
