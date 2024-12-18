import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelguide/global/styles.dart';
import 'package:travelguide/providers/theme_provider.dart';
import 'package:travelguide/screens/onboarding/onboarding_screen2.dart';

class OnBoardingScreen1 extends StatelessWidget {
  const OnBoardingScreen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    final themeProvider = Provider.of<ThemeProvider>(context);
    bool isDark = themeProvider.themeType == ThemeType.dark;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isDark ?  Image.asset("assets/images/traveler.png"):
          Image.asset("assets/images/tourist.png"),
          const SizedBox(height: 50),
          Text(
            "attractions".tr(),
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Text(
            "on_boarding_1".tr(),
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
                  MaterialPageRoute(builder: (context) => const OnBoardingScreen2()),
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
