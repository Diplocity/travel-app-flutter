import 'package:flutter/material.dart';

class SinglePlaceDetail extends StatefulWidget {
  @override
  _SinglePlaceDetailState createState() => _SinglePlaceDetailState();
}

class _SinglePlaceDetailState extends State<SinglePlaceDetail> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
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
