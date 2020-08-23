import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:travelguide/providers/attraction_provider.dart';
import 'package:travelguide/providers/home_provider.dart';
import 'package:travelguide/providers/hotel_provider.dart';
import 'package:travelguide/providers/profile_provider.dart';
import 'package:travelguide/screens/login/login_view.dart';

void main() => runApp(TravelApp());

class TravelApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: providers,
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              primarySwatch: Colors.blue,
              appBarTheme: AppBarTheme(color: Color.fromRGBO(41, 182, 246, 1)),
              scaffoldBackgroundColor: Colors.white,
              fontFamily: 'Lato'),
          home: LoginView(),
//      home: TabNavigationView(),
        ));
  }
}

List<SingleChildWidget> providers = [
  ChangeNotifierProvider<HomeProvider>(create: (_) => HomeProvider()),
  ChangeNotifierProvider<AttractionProvider>(
      create: (_) => AttractionProvider()),
  ChangeNotifierProvider<ProfileProvider>(create: (_) => ProfileProvider()),
  ChangeNotifierProvider<HotelProvider>(create: (_) => HotelProvider()),
];
