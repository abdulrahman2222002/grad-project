import 'package:shared_preferences/shared_preferences.dart';

class Experiance {
  static const String _exKey = 'ex';

  static Future<void> saveExValue(int value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_exKey, value);
  }

  static Future<int?> getExValue() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_exKey) ?? 0;
  }
}
