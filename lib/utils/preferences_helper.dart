import 'package:shared_preferences/shared_preferences.dart';

class PreferencesHelper {
  static const _LAST_UPDATE = "last_update";

  static Future<DateTime> getLastUpdate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return DateTime.fromMillisecondsSinceEpoch(prefs.getInt(_LAST_UPDATE) ?? 0);
  }

  static setLastUpdate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_LAST_UPDATE, DateTime.now().millisecondsSinceEpoch);
  }
}
