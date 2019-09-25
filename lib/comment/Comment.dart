import 'package:shared_preferences/shared_preferences.dart';

class Storage{

static Future<void> setString(key,value)async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(key, value);
}
static Future<String> getString(key)async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString(key);
}
static Future<void> remove(key)async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove(key);
}

}
