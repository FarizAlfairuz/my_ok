import 'package:flutter/material.dart';
import 'package:my_ok/layout.dart';
import 'dart:async';
import 'landingpage.dart';

class Splashscreen extends StatefulWidget {
  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  bool flag = false;

  @override
  void initState() {
    super.initState();
    startTimer();
    continueTimer();
  }

  startTimer() async {
    var duration = Duration(milliseconds: 900);
    return Timer(duration, flagState);
  }

  flagState() {
    setState(() {
      flag = !flag;
    });
  }

  continueTimer() async {
    var duration = Duration(seconds: 4);
    return Timer(duration, route);
  }

  route() {
    Navigator.push(
      context,
      PageRouteBuilder(
          transitionDuration: Duration(milliseconds: 300),
          transitionsBuilder: (context, animation, animationTime, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          pageBuilder: (context, animation, animationTime) {
            return LandingPage();
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenHeight,
          child: Stack(
            children: <Widget>[
              AnimatedContainer(
                duration: Duration(milliseconds: 1000),
                curve: Curves.easeInOutBack,
                color: flag ? Color(0xFF1D3557) : Colors.white,
                height: 3 * SizeConfig.screenHeight / 4,
              ),
              AnimatedPositioned(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOutBack,
                top: flag
                    ? SizeConfig.blockHorizontal
                    : -SizeConfig.blockHorizontal * 20,
                left: -SizeConfig.blockHorizontal * 30,
                child: Image(
                  image: AssetImage('assets/images/splashscreen/ellipse1.png'),
                  fit: BoxFit.fitHeight,
                  height: flag
                      ? SizeConfig.blockHorizontal * 150
                      : SizeConfig.blockHorizontal * 120,
                ),
              ),
              AnimatedPositioned(
                duration: Duration(milliseconds: 600),
                curve: Curves.easeInOutBack,
                top: flag
                    ? SizeConfig.blockHorizontal * 4
                    : -SizeConfig.blockHorizontal * 16,
                right: -SizeConfig.blockHorizontal * 40,
                child: Image(
                  image: AssetImage('assets/images/splashscreen/ellipse2.png'),
                  fit: BoxFit.fitHeight,
                  height: flag
                      ? SizeConfig.blockHorizontal * 130
                      : SizeConfig.blockHorizontal * 100,
                ),
              ),
              AnimatedPositioned(
                duration: Duration(milliseconds: 700),
                curve: Curves.easeInOutBack,
                top: flag
                    ? -SizeConfig.blockHorizontal * 15
                    : -SizeConfig.blockHorizontal * 35,
                left: -SizeConfig.blockHorizontal * 15,
                child: Image(
                  image: AssetImage('assets/images/splashscreen/ellipse3.png'),
                  fit: BoxFit.fitHeight,
                  height: flag
                      ? SizeConfig.blockHorizontal * 130
                      : SizeConfig.blockHorizontal * 100,
                ),
              ),
              AnimatedPositioned(
                duration: Duration(milliseconds: 800),
                curve: Curves.easeInOutBack,
                top: flag
                    ? -SizeConfig.blockHorizontal * 22
                    : -SizeConfig.blockHorizontal * 42,
                left: -SizeConfig.blockHorizontal * 22,
                child: Image(
                  image: AssetImage('assets/images/splashscreen/ellipse4.png'),
                  fit: BoxFit.fitHeight,
                  height: flag
                      ? SizeConfig.blockHorizontal * 130
                      : SizeConfig.blockHorizontal * 100,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
