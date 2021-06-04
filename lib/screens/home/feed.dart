import 'package:flutter/material.dart';
import 'package:tiktoklikescroller/tiktoklikescroller.dart';

class FeedScreen extends StatefulWidget {
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  final List<Color> colors = <Color>[Colors.red, Colors.blue, Colors.green];

  final List qouteItems = [
    {
      "quote":
          "What's the point of being alive if you don't atleast try to do something remarkable.",
      "image": '1',
      'author': ''
    },
    {"quote": '', "image": '2', 'author': ''},
    {"quote": '', "image": '3', 'author': ''},
    {"quote": '', "image": '4', 'author': ''},
    {"quote": '', "image": '5', 'author': ''},
    {"quote": '', "image": '6', 'author': ''},
    {"quote": '', "image": '7', 'author': ''},
    {"quote": '', "image": '8', 'author': ''},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment(-1.0, -2.0),
              end: Alignment(1.0, 1.0),
              colors: [Colors.green, Colors.greenAccent, Colors.greenAccent])),
      child: TikTokStyleFullPageScroller(
          swipePositionThreshold: 0.2,
          swipeVelocityThreshold: 2000,
          animationDuration: const Duration(milliseconds: 500),
          contentSize: qouteItems.length,
          builder: (context, index) {
            var item = qouteItems[index];
            return Container(
                child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height,
                  foregroundDecoration: BoxDecoration(color: Colors.black38),
                  child: Image.asset(
                    "assets/images/${item['image']}.webp",
                    fit: BoxFit.fill,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 10),
                            child: Text(
                              "What's the point of being alive if you don't atleast try to do something remarkable.",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 24, color: Colors.white),
                            ),
                          ),
                          Text(
                            "--------- JOHN GREEN  --------",
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(fontSize: 14, color: Colors.white60),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ));
          }),
    );
  }
}
