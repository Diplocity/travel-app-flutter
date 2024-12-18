import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:travelguide/global/styles.dart';

Widget bottomNavigation(int index, Function(int)? onItemTapped) {
  return BottomNavigationBar(
      items:  <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: const SizedBox(
            height: 24,
            child: Icon(
              Icons.home,
              size: 20.0,
            ),
          ),
          label: 'home'.tr(),
        ),
        BottomNavigationBarItem(
          icon: const SizedBox(
            height: 24,
            child: Icon(
              Icons.place,
              size: 20.0,
            ),
          ),
          label: 'attractions'.tr(),
        ),
        BottomNavigationBarItem(
          icon: const SizedBox(
            height: 24,
            child: Icon(
              Icons.account_circle,
              size: 20.0,
            ),
          ),
          label: 'profile'.tr(),
        ),
        BottomNavigationBarItem(
          icon: const SizedBox(
            height: 24,
            child: Icon(
              Icons.hotel,
              size: 20.0,
            ),
          ),
          label: 'hotels'.tr(),
        ),
      ],
      currentIndex: index,
      selectedItemColor: kBlue,
      unselectedItemColor: kGrey,
      selectedFontSize: 12,
      onTap: onItemTapped,
      elevation: 18,
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: true);
}
