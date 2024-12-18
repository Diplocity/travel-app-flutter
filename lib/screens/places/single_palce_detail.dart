import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelguide/providers/theme_provider.dart';


class SinglePlaceDetail extends StatefulWidget {
  final String image;
  final String name;
  final String detail;
  final String country;

  const SinglePlaceDetail(
      {Key? key,
      required this.image,
      required this.name,
      required this.detail,
      required this.country})
      : super(key: key);

  @override
  SinglePlaceDetailState createState() => SinglePlaceDetailState();
}

class SinglePlaceDetailState extends State<SinglePlaceDetail> {
  bool isFavourite = false;

  _addToFavourite() {
    setState(() {
      isFavourite = !isFavourite;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final themeProvider = Provider.of<ThemeProvider>(context);
    ThemeType theme = themeProvider.themeType;

    return Scaffold(
      backgroundColor: theme == ThemeType.dark
          ? Colors.black : Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: width,
              height: height / 2,
              alignment: Alignment.topLeft,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(60.0)),
                  image: DecorationImage(
                      image: AssetImage(widget.image), fit: BoxFit.cover)),
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Text(
                          widget.name,
                          style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(74, 74, 74, .9)),
                        ),
                      ),
                      Expanded(
                          flex: 0,
                          child: IconButton(
                              icon: Icon(
                                isFavourite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: Colors.red,
                                size: 30,
                              ),
                              onPressed: _addToFavourite)),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 12),
                    child: Text(
                      widget.country,
                      style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Color(0xffcfcfcf)),
                    ),
                  ),
                  Text(widget.detail,
                      style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
