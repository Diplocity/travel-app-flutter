import 'package:flutter/material.dart';
import 'package:travelguide/providers/theme_provider.dart';
import 'package:travelguide/screens/places/single_palce_detail.dart';


Widget attractionSection({data, required String title, theme}) {
  return Column(
    children: <Widget>[
      InkWell(
        onTap: () {},
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 18, left: 5, right: 5),
                child: Text(
                  title,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const Expanded(flex: 0, child: Icon(Icons.arrow_forward)),
          ],
        ),
      ),
      SizedBox(
          height: 160,
          child: ListView.builder(
            itemCount: data.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                width: 160,
                margin: const EdgeInsets.only(right: 4),
                child: attractionCard(
                    context: context,
                    img: "assets/${data[index].image}",
                    name: data[index].name,
                    country: data[index].country,
                    detail: data[index].detail,
                    theme: theme),
              );
            },
          ))
    ],
  );
}

Widget attractionCard(
    {required BuildContext context,
    required String img,
    required String name,
    required String country,
    required String detail,
    theme}) {
  navigateAttractionList() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => SinglePlaceDetail(
                image: img,
                name: name,
                detail: detail,
                country: country,
              )),
    );
  }

  return Card(
    elevation: 3,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: InkWell(
      onTap: navigateAttractionList,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 90,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image:
                    DecorationImage(image: AssetImage(img), fit: BoxFit.cover)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 5, right: 5),
            child: Text(
              name,
              style:  TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: theme == ThemeType.dark
                      ?  const Color(0xffcfcfcf) :  const Color(0xff4a4a4a)
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4, left: 5, right: 5),
            child: Text(
              country,
              style:  TextStyle(
                  fontSize: 12,
                  color: theme == ThemeType.dark
                      ?  const Color(0xffcfcfcf) :  const Color(0xff858585)
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
