import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HotelCardView extends StatelessWidget {
  final String hotel;
  final String address;
  final String img;
  final String detail;
  final String price;
  final double rating;

  HotelCardView(
      {Key? key,
      required this.hotel,
      required this.address,
      required this.img,
      required this.detail,
      required this.price,
      required this.rating})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return Card(
        margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          children: <Widget>[
            Container(
              height: isPortrait ? h / 6 : w / 6,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                      image: AssetImage(img), fit: BoxFit.cover)),
            ),
            Container(
              padding: EdgeInsets.only(top: 12, left: 20, bottom: 12),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Text(
                            hotel,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          child: Text(
                            address,
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      child: Container(
                    margin: EdgeInsets.only(right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          child: Text(
                            price,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          child: Text(
                            "per night",
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  )),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 8, left: 20, bottom: 12),
              alignment: Alignment.centerLeft,
              child: RatingBarIndicator(
                rating: rating,
                itemCount: 5,
                itemSize: 30.0,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
              ),
            )
          ],
        ));
  }
}
