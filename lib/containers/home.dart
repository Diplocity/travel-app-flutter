import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelguide/components/home/sugessions.dart';
import 'package:travelguide/components/search-card.dart';
import 'package:travelguide/providers/home_provider.dart';

class HomePage extends StatelessWidget {

  HomePage({Key key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final homeProvider = Provider.of<HomeProvider>(context);

    return Scaffold(
      body:  SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(8.0),
              width: width,
              height: height/2,
              decoration: BoxDecoration(
                  borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(60.0)),
                  image: DecorationImage(
                      image: AssetImage('assets/img004.jpg'),
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.7), BlendMode.dstATop),
                      fit: BoxFit.cover)),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 80.0),
                    child: Text(
                      "Where you want to go ?",
                      style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500, color: Colors.white),
                    ),
                  ),
//                  Container(
//                    margin: EdgeInsets.only(top: 10.0),
//                    child: Text(
//                      "Travel is the only thing that you buy that makes you richer",
//                      textAlign: TextAlign.center,style: TextStyle(color: Colors.white, fontSize: 16),
//                    ),
//                  ),
                  Container(
                    child: searchCard((value) {}, width, () {}),
                  ),

                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              child: attractionSection(homeProvider.suggestionList, "Suggestions"),
            ),

            Container(
              padding: EdgeInsets.all(8.0),
              child: attractionSection(homeProvider.topRatedPlaces, "Top Rated"),
            ),
          ],
        ) ,
      ),
    );
  }
}




