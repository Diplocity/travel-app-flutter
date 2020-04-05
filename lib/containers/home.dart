import 'package:flutter/material.dart';
import 'package:travelguide/containers/picture-slider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  navigateToPlacesScreen() {
    Navigator.push(
        context, MaterialPageRoute(builder: (BuildContext context) => PlacesPictures()));
  }
  
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: navigateToPlacesScreen),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: width,
              height: height / 1.7,
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(60.0)),
                  image: DecorationImage(
                      image: AssetImage('assets/img001.jpg'),
                      fit: BoxFit.cover)),
              child: Column(
                children: <Widget>[],
              ),
            )
          ],
        ),
      ),
    );
  }
}
