import 'package:flutter/foundation.dart';
import 'package:travelguide/models/hotel.dart';
import 'package:travelguide/services/hotel_list_loader.dart';

class HotelProvider with ChangeNotifier {
  List<HotelModel> hotelList = [];

  getHotelDataList() async {
    await getHotelList().then((res) {
      hotelList = res;
    });
    notifyListeners();
  }
}
