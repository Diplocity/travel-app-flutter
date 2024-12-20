import 'package:travelguide/models/hotel.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

Future<List<HotelModel>> getHotelList() async {
  String data = await rootBundle.loadString('assets/data_resources/hotel.json');
  Iterable js = json.decode(data);
  List<HotelModel> hotels = js.map<HotelModel>((model) {
    return HotelModel.fromJson(model);
  }).toList();

  return hotels;
}
