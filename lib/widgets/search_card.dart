import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

Widget searchCard(onValueSaved, double width, onSearchPressed) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50.0),
    ),
    margin: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),
      ),
      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: SizedBox(
              child: textField(onValueSaved, 'search'.tr()),
            ),
          ),
          Expanded(
            flex: 0,
            child: IconButton(
                icon: const Icon(
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

Widget iconButton(icon, text, color, onPressed) {
  return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: <Widget>[
          Icon(
            icon,
            size: 38,
            color: color,
          ),
          Text(
            text,
            style: TextStyle(color: color, fontSize: 13),
          )
        ],
      ));
}
