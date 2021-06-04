import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gratitude/screens/share.dart';
import 'package:tiktoklikescroller/tiktoklikescroller.dart';


class FeedScreen extends StatefulWidget {
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  final List<Color> colors = <Color>[Colors.red, Colors.blue, Colors.green];
  GlobalKey globalKey = GlobalKey();


  final List qouteItems = [
    {
      "quote":
          "What's the point of being alive if you don't atleast try to do something remarkable.",
      "image": '1',
      'author': ''
    },
    {
      "quote":
          "What's the point of being alive if you don't atleast try to do something remarkable.",
      "image": '2',
      'author': 'JOHN GREEN'
    },
    {
      "quote":
          "What's the point of being alive if you don't atleast try to do something remarkable.",
      "image": '3',
      'author': 'JOHN GREEN'
    },
    {
      "quote":
          "What's the point of being alive if you don't atleast try to do something remarkable.",
      "image": '4',
      'author': 'JOHN GREEN'
    },
    {
      "quote":
          "What's the point of being alive if you don't atleast try to do something remarkable.",
      "image": '5',
      'author': 'JOHN GREEN'
    },
    {
      "quote":
          "What's the point of being alive if you don't atleast try to do something remarkable.",
      "image": '6',
      'author': 'JOHN GREEN'
    },
    {
      "quote":
          "What's the point of being alive if you don't atleast try to do something remarkable.",
      "image": '7',
      'author': 'JOHN GREEN'
    },
    {
      "quote":
          "What's the point of being alive if you don't atleast try to do something remarkable.",
      "image": '8',
      'author': 'JOHN GREEN'
    },
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
                              item['quote'],
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 24, color: Colors.white),
                            ),
                          ),
                          Text(
                            "--------- ${item['author']}  --------",
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(fontSize: 14, color: Colors.white60),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ShareScreen(
                                quoteItems: qouteItems, index: index)));
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        margin: EdgeInsets.all(30),
                        decoration: BoxDecoration(
                            color: Colors.white38,
                            borderRadius: BorderRadius.circular(10)),
                        child: Icon(
                          CupertinoIcons.share,
                          color: Colors.white70,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
