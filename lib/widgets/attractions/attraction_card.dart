import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelguide/screens/places/single_palce_detail.dart';
import 'package:travelguide/providers/theme_provider.dart';

class AttractionCard extends StatelessWidget {
  final String img;
  final String name;
  final String country;
  final String detail;

  const AttractionCard(
      {Key? key,
      required this.img,
      required this.name,
      required this.country,
      required this.detail})
      : super(key: key);

  navigateAttractionList(BuildContext context) {
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

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    ThemeType theme = themeProvider.themeType;
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: InkWell(
          onTap: () {
            navigateAttractionList(context);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 110,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                        image: AssetImage(img), fit: BoxFit.cover)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 5, right: 5),
                child: Text(
                  name,
                  style:  TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                     color: theme == ThemeType.dark
                  ?  const Color(0xffcfcfcf) :  const Color(0xff4a4a4a)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4, left: 5, right: 5),
                child: Text(
                  country,
                  style:  TextStyle(
                      fontSize: 12, color: theme == ThemeType.dark
                  ?  const Color(0xffcfcfcf) :  const Color(0xff858585)),
                ),
              ),
            ],
          ),
        ),

    );
  }
}
