import 'package:flutter/material.dart';
import 'package:gratitude/services/auth.dart';
import 'package:gratitude/services/prefrences.dart';

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  AuthService auth = AuthService();
  PrefrenceManager prefrenceManager = PrefrenceManager();

  String name = '';

  @override
  Widget build(BuildContext context) {
    prefrenceManager.getNickname().then((value) => {
          name = value,
        });
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
                        name,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                      Text(
                        "" + auth.user!.email.toString(),
                        style: TextStyle(color: Colors.grey[500]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () async {
                await auth.signOut();
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/', (route) => false);
              },
              child: Container(
                width: double.infinity,
                color: Colors.orange,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(20),
                child: Center(
                    child: Text(
                  "Sign Out",
                  style: TextStyle(color: Colors.white),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
