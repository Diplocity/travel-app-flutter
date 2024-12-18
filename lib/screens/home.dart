import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelguide/providers/home_provider.dart';
import 'package:travelguide/providers/theme_provider.dart';
import 'package:travelguide/screens/settings_screen.dart';
import 'package:travelguide/widgets/home/sugessions.dart';
import 'package:travelguide/widgets/search_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    final homeProvider = Provider.of<HomeProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    ThemeType theme = themeProvider.themeType;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
                padding: const EdgeInsets.all(8.0),
                width: width,
                height: isPortrait ? height / 2 : width / 2,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(60.0)),
                    image: DecorationImage(
                        image: theme == ThemeType.light
                            ? const AssetImage('assets/places/img004.jpg')
                            : const AssetImage(
                                'assets/images/hunter-reilly-O7NHbnjrz94-unsplash.jpg'),
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.7), BlendMode.dstATop),
                        fit: BoxFit.cover)),
                child: Stack(
                  children: [
                    Column(
                      children: <Widget>[
                        const SizedBox(
                          height: 80.0,
                        ),
                        Text(
                          "search_hint".tr(),
                          style: const TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                        searchCard((value) {}, width, () {}),
                      ],
                    ),
                    Positioned(
                        right: 20,
                        bottom: 20,
                        child: Container(
                          width: 100,
                          height: 30,
                          decoration: BoxDecoration(
                            color: theme == ThemeType.light
                                ? Colors.white
                                : Colors.black,
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: GestureDetector(
                              child: const Icon(
                                Icons.settings,
                                size: 26,
                              ),
                              onTap: () {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            const SettingsScreen()),
                                    (r) => false);
                              }),
                        ))
                  ],
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: attractionSection(
                  data: homeProvider.suggestionList,
                  title: "suggestions".tr(),
                  theme: theme),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: attractionSection(
                  data: homeProvider.topRatedPlaces,
                  title: "top_rated".tr(),
                  theme: theme),
            ),
          ],
        ),
      ),
    );
  }
}
