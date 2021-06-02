import 'package:flutter/material.dart';
import 'package:gratitude/screens/home/home.dart';
import '../../shared/common.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Title
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  "Account\nLogin",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 44,
                    color: Colors.black12,
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
                    child: Text(
                      "FORGOT ?",
                      textAlign: TextAlign.end,
                      style: TextStyle(color: Colors.white38),
                    ),
                  )
                ],
              ),

              // Footer
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => HomeScreen()));
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
        ),
      ),
    );
  }
}
