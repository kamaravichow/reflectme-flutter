import 'package:shared_preferences/shared_preferences.dart';

class PrefrenceManager {
  late SharedPreferences _preferences;

  final String _nickname_key = 'nickname';

  _init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  saveNickname(String name) async {
    if (_preferences == null) {
      _init();
      await _preferences.setString(_nickname_key, name);
    } else {
      await _preferences.setString(_nickname_key, name);
    }
  }
}
