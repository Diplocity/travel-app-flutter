import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelguide/global/styles.dart';
import 'package:travelguide/screens/onboarding/onboarding_screen3.dart';
import 'package:travelguide/providers/theme_provider.dart';

class OnBoardingScreen2 extends StatelessWidget {
  const OnBoardingScreen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    final themeProvider = Provider.of<ThemeProvider>(context);
    bool isDark = themeProvider.themeType == ThemeType.dark;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isDark
              ? Image.asset("assets/images/friends.png")
              : Image.asset("assets/images/people.png"),
          const SizedBox(height: 50),
          Text(
            "connect_with_friends".tr(),
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Text(
            "on_boarding_2".tr(),
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(30),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: kBlue,
                minimumSize: Size(w, 46),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const OnBoardingScreen3()),
                );
              },
              child:  Text(
                'next'.tr(),
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
