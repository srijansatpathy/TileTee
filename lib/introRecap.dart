import 'package:flutter/material.dart';
import 'package:intro_slider/dot_animation_enum.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:mi_card/mainWelcome.dart';

class IntroRecap extends StatefulWidget {
  IntroRecap({Key key}) : super(key: key);

  @override
  IntroScreenState createState() => new IntroScreenState();
}

class IntroScreenState extends State<IntroRecap> {
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

  void onDonePress() async {
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
        onWillPop: () async => true,
        child: Scaffold(
          body: Container(
            color: Colors.white,
            width: double.infinity,
            height: double.infinity,
            child: Container(
              margin: EdgeInsets.only(bottom: 30.0, top: 90.0),
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
      onDonePress: this.onDonePress,
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
