import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Container(
                height: 200,
                width: 150,
                decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(10))),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Aravind",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                    Text(
                      "kamaravichow@gmail.com",
                      style: TextStyle(color: Colors.grey[500]),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      )),
    );
  }
}
