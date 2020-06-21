import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:travelguide/models/friend.dart';

Future<List<Friend>> getFriendsData() async {
  String data =
      await rootBundle.loadString('assets/data_resources/friends.json');
  Iterable js = json.decode(data);
  List<Friend> friends = js.map<Friend>((model) {
    return Friend.fromJson(model);
  }).toList();

  return friends;
}
