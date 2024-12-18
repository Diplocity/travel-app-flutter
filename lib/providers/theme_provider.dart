import 'package:flutter/material.dart';
import 'package:travelguide/global/save_preferences.dart';
import 'package:travelguide/global/theme_model.dart';

enum ThemeType { light, dark }
GlobalFunctions gf = GlobalFunctions();

class ThemeProvider extends ChangeNotifier {
  ThemeData currentTheme = lightTheme;
  ThemeType themeType = ThemeType.light;

  setInitialTheme(ThemeData theme){
    currentTheme = theme;
    themeType = theme == lightTheme ? ThemeType.light : ThemeType.dark;
    notifyListeners();
  }

  lightThemeEnable(){
    currentTheme = lightTheme;
    themeType = ThemeType.light;
    gf.setTheme("light");
    notifyListeners();
  }

  darkThemeEnable(){
    currentTheme = darkTheme;
    themeType = ThemeType.dark;
    gf.setTheme("dark");
    notifyListeners();
  }

}