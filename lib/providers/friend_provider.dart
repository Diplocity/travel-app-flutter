import 'package:flutter/foundation.dart';
import 'package:travelguide/models/friend.dart';
import 'package:travelguide/services/friends_data_loader.dart';

class FriendProvider with ChangeNotifier {
  List<Friend> friends = [];

  getFriendsDataList() {
    getFriendsData().then((res) {
      friends = res;
    });
  }

}

