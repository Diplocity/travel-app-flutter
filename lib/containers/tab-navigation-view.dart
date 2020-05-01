import 'package:flutter/material.dart';
import 'package:travelguide/containers/home.dart';
import 'package:travelguide/containers/places/all-attractions-view.dart';
import 'package:travelguide/containers/places/attraction-list.dart';
import 'package:travelguide/containers/profile.dart';

import 'hotels/near-by-hotels.dart';

class TabNavigationView extends StatefulWidget {
  @override
  _TabNavigationView createState() => _TabNavigationView();
}

class _TabNavigationView extends State<TabNavigationView> {
  List items = [
    MenuItem(
        index: 0, x: -1, name: 'home', color: Colors.grey, icon: Icons.home),
    MenuItem(
        index: 1,
        x: -.25,
        name: 'explore',
        color: Colors.grey,
        icon: Icons.explore),
    MenuItem(
        index: 2,
        x: .25,
        name: 'profile',
        color: Colors.grey,
        icon: Icons.person),
    MenuItem(
        index: 3, x: 1, name: 'hotel', color: Colors.grey, icon: Icons.hotel),
  ];
  static double tabBarHeight = 60;

  MenuItem _active;

  List<Widget> _children = <Widget>[
    HomePage(tabHeight: tabBarHeight),
    AllAttractionsView(),
    ProfileView(),
    HotelListView()
  ];

  @override
  void initState() {
    super.initState();
    _active = items[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        child: navBar(context),
      ),
      body: _children.elementAt(_active.index),
    );
  }

  Widget navBar(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
          boxShadow: [BoxShadow(
              color: Colors.black,
              blurRadius: 2.0,
              offset: Offset(2.0, 2.0)
          ),]
      ),
      height: tabBarHeight,
      child: Stack(
        children: <Widget>[
          AnimatedContainer(
            duration: Duration(milliseconds: 200),
            alignment: Alignment(_active.x, -1),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 1000),
              height: 8,
              width: w * .25,
              color: Colors.blue,
            ),
          ),
          Container(
            child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: items.map((item) {
                  return Expanded(
                      child: Center(
                    child: Container(
                      child: _showIcon(item, item.icon,
                          item == _active ? Colors.blue : item.color),
                    ),
                  ));
                }).toList()),
          )
        ],
      ),
    );
  }

  Widget _showIcon(MenuItem item, icon, color) {
    return GestureDetector(
      child: AspectRatio(
          aspectRatio: 1,
          child: Icon(
            icon,
            color: color,
          )),
      onTap: () {
        setState(() {
          _active = item;
        });
      },
    );
  }
}

class MenuItem {
  final String name;
  final Color color;
  final double x;
  final IconData icon;
  final int index;

  MenuItem({this.name, this.color, this.x, this.icon, this.index});
}
