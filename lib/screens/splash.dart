import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:gratitude/screens/auth/getstarted.dart';
import 'package:rive/rive.dart' as rive;

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  bool _logoVisibility = false;

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 2000), () {
      setState(() {
        _logoVisibility = true;
      });
    });
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        // if (snapshot.hasError) {
        //   return SomethingWentWrong();
        // }

        // Once complete, show your application
        if (_logoVisibility) {
          if (snapshot.connectionState == ConnectionState.done) {
            return GettingStartedScreen();
          }
        }

        // Splash
        return Scaffold(
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
      },
    );
  }
}
