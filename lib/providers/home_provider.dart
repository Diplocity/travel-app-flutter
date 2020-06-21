import 'package:flutter/foundation.dart';
import 'package:travelguide/models/attractions.dart';
import 'package:travelguide/services/attraction_loader.dart';


class HomeProvider with ChangeNotifier {
  List<Attraction> suggestionList = [];
  List<Attraction> topRatedPlaces = [];


  getAttractionSuggestionList() async{
    await getSuggestionsData().then((res) {
      suggestionList = res;
    });
    notifyListeners();
  }

  getTopRatedPlacesList() async{
    await getTopRatedData().then((res) {
      topRatedPlaces = res;
    });
    notifyListeners();
  }


}

