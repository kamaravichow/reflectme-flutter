import 'dart:ffi';

class Entries {
  String author;
  int mood;
  int timestamp;
  List<dynamic> activities;
  List<dynamic> feelings;
  String title;
  String message;
  Map pictures;

  Entries(
      {required this.author,
      required this.mood,
      required this.timestamp,
      required this.activities,
      required this.feelings,
      required this.title,
      required this.message,
      required this.pictures});

  factory Entries.fromMap(Map data) {
    return Entries(
        author: data['author'] ?? '',
        mood: data['mood'] ?? 0,
        timestamp: data['timestamp'] ?? 0,
        activities: data['activities'] as List<dynamic>,
        feelings: data['feelings'] as List<dynamic>,
        title: data['title'] ?? '',
        message: data['message'] ?? '',
        pictures: data['pictures'] ?? {});
  }
}
