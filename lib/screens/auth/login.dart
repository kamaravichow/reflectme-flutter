import 'package:flutter/material.dart';
import 'package:gratitude/screens/home/home.dart';
import 'package:gratitude/services/auth.dart';
import 'package:gratitude/shared/verifydialog.dart';
import '../../shared/common.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthService auth = AuthService();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool _showDialog = false;

  var snackbar;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: Duration(milliseconds: 1000),
        curve: Curves.fastLinearToSlowEaseIn,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment(-1.0, -1.0),
                end: Alignment(1.0, 1.0),
                colors: [Colors.purple, Colors.purple, Colors.deepPurple])),
        child: SafeArea(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Title
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 20),
                    child: Text(
                      "Welcome back,\nLet's get back to your account",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white30,
                      ),
                    ),
                  ),

                  // Boxes
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
                          onChanged: (String text) {
                            print(text);
                          },
                          controller: _emailController,
                          style: TextStyle(fontSize: 18, color: Colors.white),
                          decoration: InputDecoration(
                              hintText: "Email",
                              border: InputBorder.none,
                              hintStyle: TextStyle(color: Colors.grey[400])),
                          maxLines: 1,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(10)),
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        padding: EdgeInsets.all(10),
                        child: TextField(
                          obscureText: true,
                          cursorColor: Colors.white30,
                          textAlign: TextAlign.center,
                          controller: _passwordController,
                          style: TextStyle(fontSize: 18, color: Colors.white),
                          decoration: InputDecoration(
                              hintText: "Password",
                              border: InputBorder.none,
                              hintStyle: TextStyle(color: Colors.grey[400])),
                          maxLines: 1,
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(20),
                        child: GestureDetector(
                          onTap: () {},
                          child: Text(
                            "FORGOT ?",
                            textAlign: TextAlign.end,
                            style: TextStyle(color: Colors.white38),
                          ),
                        ),
                      )
                    ],
                  ),

                  // Footer
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (_emailController.text.isNotEmpty &&
                              _passwordController.text.isNotEmpty) {
                            if (_passwordController.text.length >= 6) {
                              auth
                                  .emailLogin(_emailController.text,
                                      _passwordController.text, context)
                                  .then((value) => {
                                        if (value != null)
                                          {
                                            if (value.emailVerified)
                                              {
                                                print("pushing to home"),
                                                Navigator.of(context)
                                                    .pushNamedAndRemoveUntil(
                                                        '/home',
                                                        (route) => false),
                                              }
                                            else
                                              {
                                                auth
                                                    .checkEmailVerification()
                                                    .then((value) =>
                                                        print(value)),
                                                _showSnackbar(
                                                    "Email not verified !"),
                                                setState(() {
                                                  _showDialog = true;
                                                }),
                                              }
                                          }
                                      });
                            } else {
                              _showSnackbar(
                                  "Password need to be atleast 6 characters");
                            }
                          } else {
                            _showSnackbar("Enter a valid password");
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
                                    "LOGIN",
                                    style: TextStyle(
                                        color: Colors.purple, fontSize: 16),
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: PrivacyPolicyText(),
                      )
                    ],
                  ),
                ],
              ),
              Visibility(
                visible: _showDialog,
                child: VerificationDialog(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _showSnackbar(String message) {
    snackbar = new SnackBar(
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
