import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gratitude/services/models.dart';
import 'package:rive/rive.dart';
import 'package:timeago/timeago.dart' as timeago;

class EntryItem extends StatelessWidget {
  final Entries entries;
  const EntryItem({Key? key, required this.entries}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 20),
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              offset: Offset(0.0, 20.0), //(x,y)
              blurRadius: 6.0,
            ),
          ]),
      child: InkWell(
        child: Row(children: [
          Container(
            width: 60,
            height: 60,
            margin: EdgeInsets.all(10),
            child: RiveAnimation.asset(
              "assets/rive/abhi.riv",
              animation: 'bink',
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                entries.title,
                style: TextStyle(color: Colors.black87, fontSize: 16),
              ),
              Text(
                entries.message,
                style: TextStyle(color: Colors.black38, fontSize: 16),
              ),
              Text(
                entries.activities.toString(),
                style: TextStyle(color: Colors.black38, fontSize: 12),
              ),
              Text(
                entries.feelings.toString(),
                style: TextStyle(color: Colors.black38, fontSize: 12),
              ),
              Text(
                timeago.format(
                    DateTime.fromMillisecondsSinceEpoch(entries.timestamp)),
                style: TextStyle(color: Colors.black38, fontSize: 12),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
