import 'package:flutter/material.dart';

Widget attractionCard (String img, String name,  String detail){
  return Card(
    shape:  RoundedRectangleBorder(
      borderRadius:  BorderRadius.circular(10.0),
    ),
    child: Container(
      decoration: BoxDecoration(
        borderRadius:  BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(width: 150,
            height: 100,
            decoration: BoxDecoration(
                borderRadius:  BorderRadius.circular(10.0),
                image: DecorationImage(
                    image: AssetImage(img),
                    fit: BoxFit.cover)),),
          Container(
            margin: EdgeInsets.only(top: 8,left: 5),
            child: Text(
              name, style: TextStyle(fontWeight: FontWeight.w600),),),
          Container(
            margin: EdgeInsets.only(top: 4,left: 5),
            child: Text(detail),),
        ],
      ),
    ),
  );
}