import 'package:flutter/material.dart';
import 'package:gratitude/services/models.dart';

class EntryItem extends StatelessWidget {
  final Entries entries;
  const EntryItem({Key? key, required this.entries}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 400,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.purple),
      child: Card(
        color: Colors.purple,
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                entries.title,
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
