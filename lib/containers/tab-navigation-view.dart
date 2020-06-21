import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelguide/components/bottom_navigation.dart';
import 'package:travelguide/containers/home.dart';
import 'package:travelguide/containers/places/all-attractions-view.dart';
import 'package:travelguide/containers/profile.dart';
import 'package:travelguide/models/attractions.dart';
import 'package:travelguide/providers/attraction_provider.dart';
import 'package:travelguide/providers/friend_provider.dart';
import 'package:travelguide/providers/home_provider.dart';
import 'package:travelguide/services/attraction_loader.dart';

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
    final frMdl = Provider.of<FriendProvider>(context, listen: false);
    attrMdl.getAttractionCategoryList();
    homeMdl.getAttractionSuggestionList();
    homeMdl.getTopRatedPlacesList();
    frMdl.getFriendsDataList();
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
      ProfileView(key: PageStorageKey('profile')),
      HotelListView(key: PageStorageKey('hotels'))
    ];

    return Scaffold(
      body: PageStorage(bucket: _bucket, child: _children.elementAt(_index)),
      bottomNavigationBar: bottomNavigation(_index, _onItemTapped),
    );
  }

}


