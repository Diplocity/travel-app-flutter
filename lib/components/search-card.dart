import 'package:flutter/material.dart';

Widget searchCard(onValueSaved, double width, onSearchPressed) {
  return Card(
    shape:  RoundedRectangleBorder(
      borderRadius:  BorderRadius.circular(50.0),
    ),
    margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
    child: Container(
      decoration: BoxDecoration(
        borderRadius:  BorderRadius.circular(50.0),
      ),
      padding: EdgeInsets.only(left: 15.0, bottom: 0.0, top: 5.0),
      child: Row(
        children: <Widget>[
          Container(
            width: width * .6,
            child: textField(onValueSaved, 'Search...'),
          ),
          Container(
            child: IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                onPressed: onSearchPressed),
          )
        ],
      ),
    ),
  );
}

Widget textField(onValueSaved, String hintText) {
  return TextFormField(
    keyboardType: TextInputType.text,
    onSaved: onValueSaved,
    decoration: InputDecoration(
      hintText: hintText,
      border: InputBorder.none,
    ),
  );
}
