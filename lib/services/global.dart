import 'package:gratitude/services/models.dart';

class Global {

  static final Map models = {
    Entries: (data) => Entries.fromMap(data),
  };
  
}