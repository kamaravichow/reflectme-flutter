import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gratitude/screens/home/account.dart';
import 'package:gratitude/screens/home/feed.dart';
import 'package:gratitude/screens/home/insights.dart';
import 'package:gratitude/screens/home/journal.dart';
import 'package:gratitude/shared/navbar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _state = 0;
  Duration _animDuration = Duration(milliseconds: 800);

  double _screenHeight = 0;

  double _journalX = 0;
  double _insightsX = 0;
  double _feedX = 0;
  double _accountX = 0;

  double _journalO = 0;
  double _insightsO = 0;
  double _feedO = 0;
  double _account0 = 0;

  @override
  Widget build(BuildContext context) {
    _screenHeight = MediaQuery.of(context).size.height;
    switch (_state) {
      case 0:
        _journalX = 0;
        _insightsX = _screenHeight;
        _feedX = _screenHeight;
        _accountX = _screenHeight;

        _journalO = 1;
        _insightsO = 0;
        _feedO = 0;
        _account0 = 0;

        break;
      case 1:
        _journalX = _screenHeight;
        _insightsX = 0;
        _feedX = _screenHeight;
        _accountX = _screenHeight;

        _journalO = 0;
        _insightsO = 1;
        _feedO = 0;
        _account0 = 0;
        break;
      case 2:
        _journalX = _screenHeight;
        _insightsX = _screenHeight;
        _feedX = 0;
        _accountX = _screenHeight;

        _journalO = 0;
        _insightsO = 0;
        _feedO = 1;
        _account0 = 0;
        break;
      case 3:
        _journalX = _screenHeight;
        _insightsX = _screenHeight;
        _feedX = _screenHeight;
        _accountX = 0;

        _journalO = 0;
        _insightsO = 0;
        _feedO = 0;
        _account0 = 1;
        break;
    }

    return Scaffold(
      floatingActionButton: Container(
        height: 65,
        width: 65,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.deepPurple),
        child: Icon(
          CupertinoIcons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: NavBar(
        notifyParent: (selection) {
          print(selection);
          setState(() {
            switch (selection) {
              case "Journal":
                _state = 0;
                break;
              case "Insights":
                _state = 1;
                break;
              case "New":
                break;
              case "Feed":
                _state = 2;
                break;
              case "Account":
                _state = 3;
                break;
            }
          });
        },
      ),
      body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment(-1.0, -1.0),
                  end: Alignment(1.0, 1.0),
                  colors: [
                Color.fromRGBO(0xFF, 0xFF, 0xFF, 100),
                Color.fromRGBO(0xF5, 0xF5, 0xF5, 100),
                Color.fromRGBO(0xE0, 0xE0, 0xE0, 100),
              ])),
          child: Stack(
            children: [
              AnimatedContainer(
                duration: _animDuration,
                curve: Curves.fastLinearToSlowEaseIn,
                transform: Matrix4.translationValues(0, _journalX, 0),
                child: Opacity(opacity: _journalO, child: JournalScreen()),
              ),
              AnimatedContainer(
                duration: _animDuration,
                curve: Curves.fastLinearToSlowEaseIn,
                transform: Matrix4.translationValues(0, _insightsX, 0),
                child: Opacity(opacity: _insightsO, child: InsightsScreen()),
              ),
              AnimatedContainer(
                duration: _animDuration,
                curve: Curves.fastLinearToSlowEaseIn,
                transform: Matrix4.translationValues(0, _feedX, 0),
                child: Opacity(opacity: _feedO, child: FeedScreen()),
              ),
              AnimatedContainer(
                duration: _animDuration,
                curve: Curves.fastLinearToSlowEaseIn,
                transform: Matrix4.translationValues(0, _accountX, 0),
                child: Opacity(opacity: _account0, child: AccountScreen()),
              ),
            ],
          )),
    );
  }
}
