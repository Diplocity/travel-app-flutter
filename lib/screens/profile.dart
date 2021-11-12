import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelguide/providers/profile_provider.dart';
import 'package:travelguide/widgets/profile/profile-comp.dart';

class ProfileView extends StatefulWidget {
  ProfileView({Key? key}) : super(key: key);
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final prMdl = Provider.of<ProfileProvider>(context, listen: false);
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    width: width,
                    height: isPortrait ? height / 4 : width / 4,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/img005.jpg'),
                            colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.8),
                                BlendMode.dstATop),
                            fit: BoxFit.cover)),
                  ),
                  Center(
                    child: Container(
                      width: isPortrait ? width / 2.6 : height / 2.6,
                      height: isPortrait ? width / 2.6 : height / 2.6,
                      margin: EdgeInsets.only(
                          top: isPortrait ? height / 8 : width / 8),
                      padding: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 30.0,
                        backgroundImage:
                            AssetImage('assets/friends/rachel.jpg'),
                      ),
                    ),
                  )
                ],
              ),
              nameDetails(),
              buttonRow(width),
              friendsRow(prMdl.friends),
              Container(
                margin: EdgeInsets.only(top: 18, bottom: 18, left: 5),
                child: Text(
                  "My Favourite",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              favPlaces(prMdl.favPlaces),
              Container(
                margin: EdgeInsets.only(top: 18, bottom: 18, left: 5),
                child: Text(
                  "I visited",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              visitedPlaces(prMdl.visitedPlaces),
            ],
          ),
        ),
      ),
    );
  }
}

Widget visitedPlaces(data) {
  return Container(
    margin: EdgeInsets.only(top: 10, left: 15, right: 10),
    height: 140,
    child: ListView.builder(
      itemCount: data.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Container(
            margin: EdgeInsets.only(right: 10),
            child: visitedThumbnail(data[index].name, data[index].image));
      },
    ),
  );
}

Widget visitedThumbnail(String name, String img) {
  return Container(
      child: Column(
    children: <Widget>[
      Container(
        width: 100,
        height: 100,
        padding: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
                image: AssetImage('assets/' + img), fit: BoxFit.cover)),
      ),
      Container(
        child: Text(name),
      )
    ],
  ));
}
