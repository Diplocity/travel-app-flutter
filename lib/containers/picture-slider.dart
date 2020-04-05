import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class PlacesPictures extends StatefulWidget {
  @override
  _PlacesPicturesState createState() => _PlacesPicturesState();
}

class _PlacesPicturesState extends State<PlacesPictures> {
  int _current = 0;
  List places = ["img001.jpg", "img002.jpg", "img003.jpg", "img004.jpg", "img005.jpg"];

  onPageChanged(index) {
    setState(() {
      _current = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

//    var imgSize = isPortrait ? (height / 100) * 46 : height * .7;

    final slider = CarouselSlider(
      viewportFraction: 0.8,
      height: isPortrait ? (height / 100) * 48 : height * .7,
      items: places != null
          ? places.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    color: Colors.red,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      child: Image(image: AssetImage("assets/"+ i), fit: BoxFit.cover,),);
                },
              );
            }).toList()
          : [],
      autoPlay: false,
      enableInfiniteScroll: false,
      aspectRatio: 2.0,
      onPageChanged: onPageChanged,
      enlargeCenterPage: true,
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: height*.1),
          child: Column(
            children: <Widget>[slider],
          ),
        ),
      ),
    );
  }
}
