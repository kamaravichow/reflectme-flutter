import 'package:flutter/material.dart';
import 'package:gratitude/services/db.dart';
import 'package:gratitude/services/models.dart';
import 'package:gratitude/shared/entry.dart';
import 'package:intl/intl.dart';

class JournalScreen extends StatefulWidget {
  @override
  _JournalScreenState createState() => _JournalScreenState();
}

class _JournalScreenState extends State<JournalScreen> {
  var _today = "";

  late List<Widget> widgets = [];
  late Future entriesFuture;

  @override
  void initState() {
    super.initState();
    entriesFuture =
        DatabaseService().getJournalEntries("8De08n6odRMZx18SxZ4njKWHJR12");
  }

  @override
  Widget build(BuildContext context) {
    _today = DateFormat.yMMMd().format(DateTime.now());
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment(-1.0, -1.0),
                end: Alignment(2.0, 1.0),
                colors: [
              Colors.grey.shade100,
              Colors.grey.shade200,
              Colors.grey.shade300
            ])),
        child: SafeArea(
          child: Container(
            width: double.infinity,
            child: FutureBuilder(
              future: entriesFuture,
              builder: (BuildContext context, AsyncSnapshot snap) {
                if (snap.hasData) {
                  List<Entries> entries = snap.data;
                  // clears widget tree
                  widgets.clear();
                  // adds top wishes widget
                  widgets.add(topWish());
                  // adds all the generated widget list to widgets list
                  widgets.addAll(entries
                      .map((entry) => EntryItem(entries: entry))
                      .toList());
                  // returns a list
                  return ListView(
                    children: widgets,
                  );
                } else if (snap.hasError) {
                  // error occured
                  return Container(
                    child: Text("Error !"),
                  );
                } else {
                  // loading progress
                  return Container(
                    child: Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 5,
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ));
  }

  Widget topWish() {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Good Afternoon,",
            style: TextStyle(color: Colors.black26, fontSize: 18),
          ),
          Text(
            "Aravi",
            style: TextStyle(color: Colors.black54, fontSize: 26),
          ),
        ],
      ),
    );
  }
}
