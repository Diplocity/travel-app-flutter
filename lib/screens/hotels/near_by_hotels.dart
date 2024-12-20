import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelguide/providers/hotel_provider.dart';
import 'package:travelguide/widgets/hotel/hotel_card_view.dart';

class HotelListView extends StatefulWidget {
  const HotelListView({Key? key}) : super(key: key);
  @override
  HotelListViewState createState() => HotelListViewState();
}

class HotelListViewState extends State<HotelListView> {
  @override
  Widget build(BuildContext context) {
    final htMdl = Provider.of<HotelProvider>(context);
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      body: Stack(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 78, left: 20, right: 20),
              child: Text(
                "find_a_place".tr(),
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
        isPortrait
            ? Padding(
                padding: const EdgeInsets.only(top: 90),
                child: ListView.builder(
                  itemCount: htMdl.hotelList.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return HotelCardView(
                      img: "assets/hotels/${htMdl.hotelList[index].image}",
                      hotel: htMdl.hotelList[index].name,
                      address: htMdl.hotelList[index].address,
                      detail: htMdl.hotelList[index].shortDetail,
                      price: htMdl.hotelList[index].price,
                      rating: htMdl.hotelList[index].rating,
                    );
                  },
                ))
            : Padding(
                padding: const EdgeInsets.only(top: 90),
                child: GridView.count(
                  crossAxisCount: 2,
                  padding: const EdgeInsets.all(4.0),
                  childAspectRatio: 1.5,
                  children: htMdl.hotelList
                      .map(
                        (item) => HotelCardView(
                          img: "assets/hotels/${item.image}",
                          hotel: item.name,
                          address: item.address,
                          detail: item.shortDetail,
                          price: item.price,
                          rating: item.rating,
                        ),
                      )
                      .toList(),
                ))
      ]),
    );
  }
}
