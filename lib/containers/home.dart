import 'package:flutter/material.dart';
import 'package:travelguide/components/search-card.dart';

class HomePage extends StatefulWidget {
  final double tabHeight;
  HomePage({this.tabHeight});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;


    return Scaffold(
      body: isPortrait ? homePageContent(context, width, height-widget.tabHeight) : SingleChildScrollView(
        child: homePageContent(context, width, height- widget.tabHeight) ,
      ),
    );
  }
}

Widget homePageContent(BuildContext context, width, height){

  TextStyle titleStyle = TextStyle(fontSize: 26, fontWeight: FontWeight.w400);

  return Column(
    children: <Widget>[
      Container(
        padding: EdgeInsets.all(10.0),
        width: width,
        height: height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/img002.jpg'),
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.3), BlendMode.dstATop),
                fit: BoxFit.cover)),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 30.0),
              alignment: Alignment.topRight,
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 30.0,
                backgroundImage: AssetImage('assets/avatar.jpg'),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              child: Text(
                "Where you want to go ?",
                style: titleStyle,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              child: Text(
                "Travel is the only thing that you buy that makes you richer",
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              child: searchCard((value) {}, width, () {}),
            )
          ],
        ),
      )
    ],
  );
}
