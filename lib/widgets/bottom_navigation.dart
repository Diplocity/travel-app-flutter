import 'package:flutter/material.dart';
import 'package:travelguide/global/styles.dart';

Widget bottomNavigation(int index, Function onItemTapped) {
  return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: SizedBox(
            height: 24,
            child: Icon(
              Icons.home,
              size: 20.0,
            ),
          ),
          title: Text('Home'),
        ),
        BottomNavigationBarItem(
          icon: SizedBox(
            height: 24,
            child: Icon(
              Icons.place,
              size: 20.0,
            ),
          ),
          title: Text('Attractions'),
        ),
        BottomNavigationBarItem(
          icon: SizedBox(
            height: 24,
            child: Icon(
              Icons.account_circle,
              size: 20.0,
            ),
          ),
          title: Text('Profile'),
        ),
        BottomNavigationBarItem(
          icon: SizedBox(
            height: 24,
            child: Icon(
              Icons.hotel,
              size: 20.0,
            ),
          ),
          title: Text('Hotels'),
        ),
      ],
      currentIndex: index,
      selectedItemColor: kBlue,
      unselectedItemColor: kGrey,
      selectedFontSize: 12,
      onTap: onItemTapped,
      backgroundColor: Colors.white,
      elevation: 18,
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: true);
}
