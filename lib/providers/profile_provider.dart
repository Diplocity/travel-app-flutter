import 'package:flutter/foundation.dart';
import 'package:travelguide/models/attractions.dart';
import 'package:travelguide/models/friend.dart';
import 'package:travelguide/services/friends_data_loader.dart';
import 'package:travelguide/services/profile_details_loader.dart';

class ProfileProvider with ChangeNotifier {
  List<Friend> friends = [];
  List<Attraction> visitedPlaces = [];
  List<Attraction> favPlaces = [];

  getFriendsDataList() async {
    await getFriendsData().then((res) {
      friends = res;
    });
    notifyListeners();
  }

  getVisitedPlaceList() async {
    await getVisitedData().then((res) {
      visitedPlaces = res;
    });
    notifyListeners();
  }

  getFavPlacesList() async {
    await getFavouriteData().then((res) {
      favPlaces = res;
    });
    notifyListeners();
  }
}
