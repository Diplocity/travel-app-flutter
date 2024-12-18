import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelguide/global/save_preferences.dart';
import 'package:travelguide/global/theme_model.dart';
import 'package:travelguide/providers/theme_provider.dart';
import 'package:travelguide/screens/onboarding/onboarding_screen1.dart';

GlobalFunctions gf = GlobalFunctions();

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  String mode = "light";

  @override
  void initState() {
    super.initState();
    getSavedMode();
    navigateToOnBoarding();
  }

  getSavedMode() async {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    gf.getTheme().then((value){
      if(value != "null"){
        mode = value.toString();
        ThemeData theme = mode == "dark" ?  darkTheme : lightTheme;
        themeProvider.setInitialTheme(theme);
      }else{
        themeProvider.setInitialTheme(lightTheme);
      }

    });

  }

  navigateToOnBoarding() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => const OnBoardingScreen1()),
          (r) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    bool isDark = themeProvider.themeType == ThemeType.dark;
    return Scaffold(
      backgroundColor: isDark ? Colors.black : Colors.white,
      body: Center(
          child: isDark
              ? Image.asset("assets/images/dark.png", height: 200, width: 150,)
              : Image.asset("assets/images/light.png", height: 200, width: 150,)),
    );
  }
}
