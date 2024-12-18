import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';
import 'package:travelguide/global/styles.dart';
import 'package:travelguide/providers/theme_provider.dart';
import 'package:travelguide/screens/tab_navigation_view.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  SettingsScreenState createState() => SettingsScreenState();
}

class SettingsScreenState extends State<SettingsScreen> {
  changeLang(id) {
    if (id == 1) {
      setState(() {
        context.setLocale(const Locale('en', 'UK'));
      });
    } else if (id == 2) {
      setState(() {
        context.setLocale(const Locale('es', 'SP'));
      });
    } else if (id == 3) {
      setState(() {
        context.setLocale(const Locale('ar', 'AE'));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return WillPopScope(
      onWillPop: () async {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => const TabNavigationView()),
            (r) => false);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Text(
            "settings".tr(),
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const TabNavigationView()),
                    (r) => false);
              },
              icon: const Icon(Icons.arrow_back_ios)),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 20, right: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Icon(FeatherIcons.globe),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                      'language'.tr(),
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  languageRow(
                      lang: "English",
                      id: 1,
                      color: "${context.locale}" == "en_UK"
                          ? const Color(0xffcfcfcf)
                          : Colors.transparent),
                  languageRow(
                      lang: "Spanish",
                      id: 2,
                      color: "${context.locale}" == "es_SP"
                          ? const Color(0xffcfcfcf)
                          : Colors.transparent),
                  languageRow(
                      lang: "Arabic",
                      id: 3,
                      color: "${context.locale}" == "ar_AE"
                          ? const Color(0xffcfcfcf)
                          : Colors.transparent),
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Icon(FeatherIcons.sunrise),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                      'theme'.tr(),
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      themeProvider.lightThemeEnable();
                    },
                    child: Row(
                      children: [
                        const Icon(
                          Icons.wb_sunny,
                          color: kBlue,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          "light_mode".tr(),
                          style: const TextStyle(color: kBlue),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 30,
                  ),
                  InkWell(
                    onTap: () {
                      themeProvider.darkThemeEnable();
                    },
                    child: Row(
                      children: [
                        const Icon(
                          Icons.nights_stay_rounded,
                          color: Colors.yellow,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          "dark_mode".tr(),
                          style: const TextStyle(color: Colors.yellow),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget languageRow({required String lang, required int id, color}) {
    return ListTile(
      tileColor: color,
      title: Text(lang),
      onTap: () {
        changeLang(id);
      },
    );
  }
}
