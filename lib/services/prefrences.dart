import 'package:shared_preferences/shared_preferences.dart';

class PrefrenceManager {
  late SharedPreferences _preferences;

  final String _nickname_key = 'nickname';

  saveNickname(String name) async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    await _preferences.setString(_nickname_key, name);
  }

  Future<String> getNickname() async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    return _preferences.getString(_nickname_key) ?? 'Abhi';
  }
}
