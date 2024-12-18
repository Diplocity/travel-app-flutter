import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelguide/providers/profile_provider.dart';
import 'package:travelguide/providers/theme_provider.dart';
import 'package:travelguide/widgets/profile/profile_comp.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);
  @override
  ProfileViewState createState() => ProfileViewState();
}

class ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final prMdl = Provider.of<ProfileProvider>(context, listen: false);
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    final themeProvider = Provider.of<ThemeProvider>(context);
    ThemeType theme = themeProvider.themeType;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: width,
                  height: isPortrait ? height / 4 : width / 4,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: const AssetImage('assets/places/img005.jpg'),
                          colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.8), BlendMode.dstATop),
                          fit: BoxFit.cover)),
                ),
                Center(
                  child: Container(
                    width: isPortrait ? width / 2.6 : height / 2.6,
                    height: isPortrait ? width / 2.6 : height / 2.6,
                    margin: EdgeInsets.only(
                        top: isPortrait ? height / 8 : width / 8),
                    padding: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                    child: const CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 30.0,
                      backgroundImage: AssetImage('assets/friends/rachel.jpg'),
                    ),
                  ),
                )
              ],
            ),
            nameDetails(),
            buttonRow(width),
            friendsRow(data: prMdl.friends, theme: theme),
            Padding(
              padding: const EdgeInsets.only(top: 18, bottom: 18, left: 5),
              child: Text(
                "my_favourite".tr(),
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            favPlaces(data: prMdl.favPlaces),
            Padding(
              padding: const EdgeInsets.only(top: 18, bottom: 18, left: 5),
              child: Text(
                "visited".tr(),
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            visitedPlaces(prMdl.visitedPlaces),
          ],
        ),
      ),
    );
  }
}

Widget visitedPlaces(data) {
  return SizedBox(
    height: 140,
    child: Padding(
      padding: const EdgeInsets.only(top: 10, left: 15, right: 10),
      child: ListView.builder(
        itemCount: data.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
              padding: const EdgeInsets.only(right: 10),
              child: visitedThumbnail(data[index].name, data[index].image));
        },
      ),
    ),
  );
}

Widget visitedThumbnail(String name, String img) {
  return Column(
    children: <Widget>[
      Container(
        width: 100,
        height: 100,
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
                image: AssetImage('assets/$img'), fit: BoxFit.cover)),
      ),
      Text(name)
    ],
  );
}
