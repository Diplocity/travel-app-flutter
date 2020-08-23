import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelguide/providers/attraction_provider.dart';
import 'package:travelguide/providers/home_provider.dart';
import 'package:travelguide/providers/hotel_provider.dart';
import 'package:travelguide/providers/profile_provider.dart';
import 'package:travelguide/screens/home.dart';
import 'package:travelguide/screens/places/all-attractions-view.dart';
import 'package:travelguide/screens/profile.dart';
import 'package:travelguide/widgets/bottom_navigation.dart';

import 'hotels/near-by-hotels.dart';

class TabNavigationView extends StatefulWidget {
  @override
  _TabNavigationView createState() => _TabNavigationView();
}

class _TabNavigationView extends State<TabNavigationView> {
  int _index = 0;

  final PageStorageBucket _bucket = PageStorageBucket();

  @override
  void initState() {
    super.initState();
    final homeMdl = Provider.of<HomeProvider>(context, listen: false);
    final attrMdl = Provider.of<AttractionProvider>(context, listen: false);
    final prMdl = Provider.of<ProfileProvider>(context, listen: false);
    final htMdl = Provider.of<HotelProvider>(context, listen: false);
    attrMdl.getAttractionCategoryList();
    homeMdl.getAttractionSuggestionList();
    homeMdl.getTopRatedPlacesList();
    prMdl.getFriendsDataList();
    prMdl.getFavPlacesList();
    prMdl.getVisitedPlaceList();
    htMdl.getHotelDataList();
  }

  void _onItemTapped(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _children = <Widget>[
      HomePage(key: PageStorageKey('home')),
      AllAttractionsView(key: PageStorageKey('attractions')),
      ProfileView(key: PageStorageKey('components.profile')),
      HotelListView(key: PageStorageKey('hotels'))
    ];

    return Scaffold(
      body: PageStorage(bucket: _bucket, child: _children.elementAt(_index)),
      bottomNavigationBar: bottomNavigation(_index, _onItemTapped),
    );
  }
}
