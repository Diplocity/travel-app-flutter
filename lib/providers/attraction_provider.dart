import 'package:flutter/foundation.dart';
import 'package:travelguide/models/attractions.dart';
import 'package:travelguide/services/attraction_loader.dart';


class AttractionProvider with ChangeNotifier {
  List<AttractionCategory> attractionList = [];


  getAttractionCategoryList() {
    getAttractionData().then((res) {
      attractionList = res;
    });
  }

}

