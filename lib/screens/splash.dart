import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rive/rive.dart' as rive;

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _logoVisibility = false;

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 2000), () {
      Navigator.pushReplacementNamed(context, "/started");
    });
    return new Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment(-1.0, -1.0),
                end: Alignment(1.0, 1.0),
                colors: [Colors.purple, Colors.purple, Colors.deepPurple])),
        child: Center(
          child: AnimatedContainer(
            duration: Duration(milliseconds: 1000),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 100,
                ),
                AnimatedContainer(
                  duration: Duration(milliseconds: 2000),
                  curve: Curves.bounceIn,
                  child: Visibility(
                    visible: true,
                    child: Text(
                      "ABHI",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 62,
                        color: Colors.white38,
                      ),
                    ),
                  ),
                ),
                Container(
                    width: 200,
                    height: 200,
                    child: rive.RiveAnimation.asset("assets/rive/logo.riv"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
