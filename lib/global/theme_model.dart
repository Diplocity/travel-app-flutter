import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  primaryColor: Colors.black,
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Colors.black,
  cardColor: const Color(0xff101820),
  bottomNavigationBarTheme:
      const BottomNavigationBarThemeData(backgroundColor: Colors.black),
  fontFamily: "Lato",
  iconTheme: const IconThemeData(color: Color(0xffcfcfcf)),
  appBarTheme: AppBarTheme(
      color: Colors.black,
      iconTheme: const IconThemeData(color: Colors.white),
      titleTextStyle:
          const TextTheme(headline4: TextStyle(color: Colors.white)).headline4
        ),
);

ThemeData lightTheme = ThemeData(
  primaryColor: const Color(0xff29b6f6),
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  cardColor: Colors.white,
  bottomNavigationBarTheme:
      const BottomNavigationBarThemeData(backgroundColor: Colors.white),
  fontFamily: "Lato",
  appBarTheme: AppBarTheme(
      color: Colors.white,
      iconTheme: const IconThemeData(color: Colors.black),
      titleTextStyle:
          const TextTheme(headline4: TextStyle(color: Colors.black)).headline4
    ),
);
