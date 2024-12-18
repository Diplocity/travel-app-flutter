import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:travelguide/providers/attraction_provider.dart';
import 'package:travelguide/providers/home_provider.dart';
import 'package:travelguide/providers/hotel_provider.dart';
import 'package:travelguide/providers/profile_provider.dart';
import 'package:travelguide/providers/theme_provider.dart';
import 'package:travelguide/screens/onboarding/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
        path: 'assets/locales',
        supportedLocales: const [Locale('en', 'UK'), Locale('es', 'SP'), Locale('ar', 'AE')],
        fallbackLocale: const Locale('en', 'UK'),
        child: MultiProvider(
            providers: providers,
            child: const TravelApp())
    ),
  );
}

class TravelApp extends StatelessWidget {
  const TravelApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeProvider>(
      create: (BuildContext context) => ThemeProvider(),
      child: Consumer<ThemeProvider>(builder: (context, model, __){
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Travel App',
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          theme: Provider.of<ThemeProvider>(context).currentTheme,
          home: const SplashScreen(),
        );
      }),
    );
  }
}

List<SingleChildWidget> providers = [
  ChangeNotifierProvider<HomeProvider>(create: (_) => HomeProvider()),
  ChangeNotifierProvider<AttractionProvider>(
      create: (_) => AttractionProvider()),
  ChangeNotifierProvider<ProfileProvider>(create: (_) => ProfileProvider()),
  ChangeNotifierProvider<HotelProvider>(create: (_) => HotelProvider()),
  ChangeNotifierProvider<ThemeProvider>(create: (_) => ThemeProvider()),
];
