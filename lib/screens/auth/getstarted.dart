import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gratitude/screens/auth/login.dart';
import 'package:gratitude/screens/auth/signup.dart';
import 'package:rive/rive.dart' as rive;

class GettingStartedScreen extends StatefulWidget {
  @override
  _GettingStartedScreenState createState() => _GettingStartedScreenState();
}

class _GettingStartedScreenState extends State<GettingStartedScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  bool _notAuthenticated = true;

  @override
  void initState() {
    if (auth.currentUser != null) {
      _notAuthenticated = false;
      Future.delayed(Duration(milliseconds: 2000), () {
        Navigator.pushNamedAndRemoveUntil(context, "/home", (route) => false);
      });
    } else {
      _notAuthenticated = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment(-1.0, -1.0),
                end: Alignment(1.0, 1.0),
                colors: [Colors.purple, Colors.purple, Colors.deepPurple])),
        child: SafeArea(
          child: Stack(
            children: [
              //
              Visibility(
                visible: _notAuthenticated,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //IMAGE HEADER
                    Column(children: [
                      Container(
                        width: double.infinity,
                        height: 230,
                        padding: EdgeInsets.symmetric(vertical: 30),
                        child: rive.RiveAnimation.asset("assets/rive/luci.riv"),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Text(
                          "Hello,\nI'm Abhi.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 10),
                        child: Text(
                          "Your own personalised \nGratitude Journal assistant",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white38,
                          ),
                        ),
                      ),
                    ]),
                    // GAP View
                    Column(
                      children: [],
                    ),
                    // Buttons
                    Column(
                      children: [
                        // sign up button
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpScreen()));
                          },
                          child: Container(
                            width: double.infinity,
                            margin: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.white),
                            padding: EdgeInsets.all(18),
                            child: Center(
                              child: Column(
                                children: [
                                  Visibility(
                                    visible: true,
                                    child: Text(
                                      "CONTINUE",
                                      style: TextStyle(
                                        color: Colors.purple,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  Visibility(
                                    visible: false,
                                    child: Container(
                                      width: 24,
                                      height: 24,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        color: Colors.purple,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        // login button
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                          },
                          child: Container(
                            width: double.infinity,
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.transparent),
                            padding: EdgeInsets.all(18),
                            child: Center(
                              child: Column(
                                children: [
                                  Visibility(
                                    visible: true,
                                    child: Text(
                                      "I ALREADY HAVE AN ACCOUNT",
                                      style: TextStyle(
                                        color: Colors.white54,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  Visibility(
                                    visible: false,
                                    child: Container(
                                      width: 24,
                                      height: 24,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        color: Colors.purple,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              //
              Visibility(
                visible: !_notAuthenticated,
                child: Container(
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
                              child: rive.RiveAnimation.asset(
                                  "assets/rive/logo.riv"))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
