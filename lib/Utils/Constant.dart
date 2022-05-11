import 'package:shared_preferences/shared_preferences.dart';

Future setPrefData({required String key, required String value}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(key, value);
}

/// get data
Future getPrefData({required String key}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var data = prefs.getString(key);
  return data;
}

/// clear data
Future clearPrefData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.clear();
}
