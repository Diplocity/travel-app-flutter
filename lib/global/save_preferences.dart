import 'package:shared_preferences/shared_preferences.dart';

class GlobalFunctions {

  // to set the language
  Future<void> setLang(String lang) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('lang',  lang);

  }

// to get the language
  Future<String> getLang() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('lang').toString();
  }

  // to set the mode
  Future<void> setTheme(String theme) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('theme',  theme);

  }

// to get the mode
  Future<String> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('theme').toString();
  }



}