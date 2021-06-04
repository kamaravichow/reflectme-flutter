import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gratitude/services/global.dart';
import 'package:gratitude/services/models.dart';

class DatabaseService {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<Entries>> getJournalEntries(String userId) async {
    print(userId);
    return _db
        .collection('entries')
        .where("author", isEqualTo: userId)
        .orderBy("timestamp", descending: true)
        .get()
        .then((QuerySnapshot snap) =>
            snap.docs.map((e) => Entries.fromMap(e.data() as Map)).toList());
  }
}

class Document<T> {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final String path;
  late DocumentReference ref;

  Document({required this.path}) {
    ref = _db.doc(path);
  }

  Future<T> getData() {
    return ref.get().then((v) => Global.models[T](v.data) as T);
  }
}

loadData() async {
  var data =
      await DatabaseService().getJournalEntries("8De08n6odRMZx18SxZ4njKWHJR12");
  return data;
}
