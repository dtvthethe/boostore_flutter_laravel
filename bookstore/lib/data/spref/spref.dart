// Cache du lieu
import 'package:shared_preferences/shared_preferences.dart';

class SPref {
  SPref._internal();
  static final SPref instance = SPref._internal();

  Future set(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

// TODO: Tai sao ko phai la Future<dynamic>
  dynamic get(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(
      key,
    ); // TODO: tai sao ko await -> do ham getString tra ve String roi
  }
}
