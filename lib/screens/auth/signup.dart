import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gratitude/services/auth.dart';
import 'package:gratitude/services/prefrences.dart';
import 'package:gratitude/shared/common.dart';
import 'package:gratitude/shared/verifydialog.dart';
import 'package:rive/rive.dart' as rive;

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  AuthService auth = AuthService();
  TextEditingController _nicknameController = TextEditingController();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  String nickname = '';
  bool _verifyDialog = false;

  bool _nicknameEntered = false;
  double windowWidth = 0;
  double windowHeight = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    windowHeight = MediaQuery.of(context).size.height;
    windowWidth = MediaQuery.of(context).size.width;
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
              AnimatedCrossFade(
                crossFadeState: _nicknameEntered
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                duration: Duration(milliseconds: 500),
                firstChild: Container(
                  width: windowWidth,
                  height: windowHeight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // ------------------- Title
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              child: rive.RiveAnimation.asset(
                                "assets/rive/abhi.riv",
                                animation: 'blink',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Text(
                                "So nice to meet you !\nWhat do you want to be called ?",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white38,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // ---------------------- TextField
                      Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(10)),
                            margin: EdgeInsets.all(20),
                            padding: EdgeInsets.all(10),
                            child: TextField(
                              cursorColor: Colors.white30,
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                              controller: _nicknameController,
                              maxLength: 20,
                              decoration: InputDecoration(
                                  hintText: "Nickname",
                                  border: InputBorder.none,
                                  counter: Container(
                                    width: 48,
                                    height: 28,
                                    padding: EdgeInsets.all(1),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white),
                                    child: Center(
                                      child: Text(
                                        "${nickname.length}/20",
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 12),
                                      ),
                                    ),
                                  ),
                                  counterStyle:
                                      TextStyle(color: Colors.white38),
                                  hintStyle: TextStyle(color: Colors.white38)),
                              onChanged: (String text) {
                                setState(() {
                                  nickname = text;
                                });
                              },
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),

                      // ----------------------- Footer
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                PrefrenceManager()
                                    .saveNickname(_nicknameController.text);
                                _nicknameEntered = true;
                              });
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
                        ],
                      ),
                    ],
                  ),
                ),
                secondChild: Container(
                  width: windowWidth,
                  height: windowHeight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // ---------------------------------
                      // ---------------------- Title
                      //-----------------------------------

                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              child: rive.RiveAnimation.asset(
                                "assets/rive/abhi.riv",
                                animation: 'blink',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Text(
                                "Finally, you'll need to create an account to secure your journal.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white38,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Boxes
                      Column(
                        children: [
                          //---------------TEXT FIELDS ------------------//

                          Container(
                            decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(10)),
                            margin: EdgeInsets.all(20),
                            padding: EdgeInsets.all(10),
                            child: TextField(
                              cursorColor: Colors.white30,
                              textAlign: TextAlign.center,
                              controller: _emailController,
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                              decoration: InputDecoration(
                                  hintText: "Email",
                                  border: InputBorder.none,
                                  hintStyle:
                                      TextStyle(color: Colors.grey[400])),
                              maxLines: 1,
                            ),
                          ),
                          // -------------------------------------------//
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(10)),
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            padding: EdgeInsets.all(10),
                            child: TextField(
                              obscureText: true,
                              controller: _passwordController,
                              cursorColor: Colors.white30,
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                              decoration: InputDecoration(
                                  hintText: "Password",
                                  border: InputBorder.none,
                                  hintStyle:
                                      TextStyle(color: Colors.grey[400])),
                              maxLines: 1,
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Text(
                              " atleast 6 characters",
                              textAlign: TextAlign.end,
                              style: TextStyle(color: Colors.white38),
                            ),
                          )
                          // --------------------------------------------//
                        ],
                      ),
                      // ---------------------------
                      // ----------------- Footer
                      // ---------------------------
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (_emailController.text.isNotEmpty &&
                                  _passwordController.text.isNotEmpty) {
                                if (_passwordController.text.length >= 6) {
                                  auth
                                      .emailSignUp(_emailController.text,
                                          _passwordController.text, context)
                                      .then((value) => {
                                            // account created now check for email verification
                                            auth.checkEmailVerification().then(
                                                  (value) => {
                                                    if (value)
                                                      {
                                                        // doesn't happen usually
                                                        Navigator.of(context)
                                                            .pushNamedAndRemoveUntil(
                                                                '/home',
                                                                (route) =>
                                                                    false),
                                                      }
                                                    else
                                                      {
                                                        setState(() {
                                                          _verifyDialog = true;
                                                        }),
                                                      }
                                                  },
                                                ),
                                          });
                                } else {
                                  _showSnackbar(
                                      "Password need to be atleast 6 characters");
                                }
                              } else {
                                _showSnackbar(
                                    "Email or password cannot be empty");
                              }
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
                                        "FINISH",
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
                          //----------------------- ---------------------//
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: PrivacyPolicyText(),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              // ---------------------------VERIFICATION DIALOG ------------//
              // ----------------------------------------------------------//
              Visibility(
                visible: _verifyDialog,
                child: VerificationDialog(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _showSnackbar(String message) {
    var snackbar = new SnackBar(
        backgroundColor: Colors.white,
        content: Container(
          width: double.infinity,
          height: 40,
          alignment: Alignment.center,
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black54,
                fontSize: 14,
                fontWeight: FontWeight.bold),
          ),
        ));

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}
