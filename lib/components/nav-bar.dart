import 'package:flutter/material.dart';

class MenuItem {
  final String name;
  final Color color;
  final double x;
  final IconData icon;
  final  int index;

  MenuItem({this.name, this.color, this.x, this.icon, this.index});
}

class NavBar extends StatefulWidget {

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
List items = [
  MenuItem(index: 0, x: -1, name: 'home', color: Colors.grey, icon: Icons.home),
  MenuItem(index: 1, x: -.25, name: 'explore', color: Colors.grey, icon: Icons.explore),
  MenuItem(index: 2, x: .25, name: 'profile', color: Colors.grey, icon: Icons.person),
  MenuItem(index: 3, x: 1, name: 'hotel', color: Colors.grey, icon: Icons.hotel),
];

  MenuItem active;

  @override
  void initState() {
    super.initState();
    active = items[0];
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    return Container(
      height: 60,
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          AnimatedContainer(
            duration: Duration(milliseconds: 200),
            alignment: Alignment(active.x, -1),
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
                  return Container(
                    alignment: Alignment(item.x, 0),
                    child: _flare(item, item.icon,
                        item == active ? Colors.blue : item.color),
                  );
                }).toList()),
          )
        ],
      ),
    );
  }

  Widget _flare(MenuItem item, icon, color) {
    return GestureDetector(
      child: AspectRatio(
          aspectRatio: 1,
          child: Icon(
            icon,
            color: color,
          )),
      onTap: () {
        setState(() {
          active = item;
        });
      },
    );
  }
}

