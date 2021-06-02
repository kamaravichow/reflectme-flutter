import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuItem {
  final String name;
  final Color color;
  final double x;
  final IconData icon;
  final IconData checkedIcon;
  MenuItem(
      {required this.name,
      required this.color,
      required this.x,
      required this.icon,
      required this.checkedIcon});
}

class NavBar extends StatefulWidget {
  @override
  final Function(String selection) notifyParent;
  NavBar({Key? key, required this.notifyParent}) : super(key: key);
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  List items = [
    MenuItem(
        name: 'Journal',
        color: Colors.blueAccent,
        x: -1.0,
        icon: CupertinoIcons.book_circle,
        checkedIcon: CupertinoIcons.book_circle_fill),
    MenuItem(
        name: 'Insights',
        color: Colors.purple,
        x: -0.5,
        icon: CupertinoIcons.graph_circle,
        checkedIcon: CupertinoIcons.graph_circle_fill),
    MenuItem(
        name: 'New',
        color: Colors.transparent,
        x: 0.0,
        icon: CupertinoIcons.add_circled,
        checkedIcon: CupertinoIcons.add_circled_solid),
    MenuItem(
        name: 'Feed',
        color: Colors.greenAccent,
        x: 0.5,
        icon: CupertinoIcons.collections,
        checkedIcon: CupertinoIcons.collections_solid),
    MenuItem(
        name: 'Account',
        color: Colors.orangeAccent,
        x: 1.0,
        icon: CupertinoIcons.person_circle,
        checkedIcon: CupertinoIcons.person_circle_fill),
  ];

  late MenuItem active;
  @override
  void initState() {
    super.initState();
    active = items[0];
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    return Container(
      height: 60,
      color: Colors.white,
      child: Stack(
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 200),
            alignment: Alignment(active.x, -1),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 1000),
              height: 4,
              width: w * 0.2,
              color: active.color,
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: items.map((item) {
                return _riveItem(item);
              }).toList(),
            ),
          )
        ],
      ),
    );
  }

  Widget _riveItem(MenuItem item) {
    return GestureDetector(
      onTap: () {
        setState(() {
          active = item;
          widget.notifyParent(item.name);
        });
      },
      child: AspectRatio(
        aspectRatio: 0.4,
        child: Padding(
          padding: EdgeInsets.only(top: 10),
          child: Container(
            child: Icon(
              item.name == active.name ? item.checkedIcon : item.icon,
              color: item.color,
            ),
          ),
        ),
      ),
    );
  }
}
