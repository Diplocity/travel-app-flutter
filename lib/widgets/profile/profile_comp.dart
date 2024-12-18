import "package:flutter/material.dart";
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:travelguide/providers/theme_provider.dart';

Widget nameDetails() {
  return Container(
    margin: const EdgeInsets.only(bottom: 15),
    child: Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(bottom: 4),
          child: const Text(
            'Rachel Green',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        const Text('rachel@example.com'),
      ],
    ),
  );
}

Widget buttonRow(w) {
  return SizedBox(
    width: w / 1.8,
    child: Row(
      children: const <Widget>[
        Expanded(child: Icon(FeatherIcons.bell)),
        Expanded(child: Icon(FeatherIcons.heart)),
        Expanded(child: Icon(FeatherIcons.image)),
        Expanded(child: Icon(FeatherIcons.users)),
      ],
    ),
  );
}

Widget friendsRow({data, theme}) {
  return Container(
    alignment: Alignment.center,
    margin: const EdgeInsets.only(top: 30, left: 15, right: 15),
    height: 130,
    child: ListView.builder(
      itemCount: data.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Container(
            margin: const EdgeInsets.only(right: 8),
            child: friendView(name:data[index].name, img: data[index].image, theme: theme));
      },
    ),
  );
}

Widget friendView({required String name, required String img, theme}) {
  return Column(
    children: <Widget>[
      Container(
        width: 80,
        height: 80,
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: theme == ThemeType.light ? Colors.white :Colors.black,
          borderRadius: BorderRadius.circular(100.0),
        ),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 30.0,
          backgroundImage: AssetImage('assets/friends/$img'),
        ),
      ),
      Text(name)
    ],
  );
}

Widget favPlaces({data}) {
  return Container(
    margin: const EdgeInsets.only(top: 10, left: 15, right: 10),
    height: 160,
    child: ListView.builder(
      itemCount: data.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: favThumbnail(name:data[index].name, img: data[index].image));
      },
    ),
  );
}

Widget favThumbnail({required String name, required String img}) {
  return Column(
    children: <Widget>[
      Container(
        alignment: Alignment.bottomCenter,
        width: 140,
        height: 160,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
                image: AssetImage('assets/$img'), fit: BoxFit.cover)),
        child: Container(
          width: 140,
          padding: const EdgeInsets.all(6.0),
          decoration: const BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0),
              )),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              const Expanded(
                  flex: 0,
                  child: Icon(
                    Icons.favorite,
                    color: Colors.red,
                  )),
            ],
          ),
        ),
      ),
    ],
  );
}
