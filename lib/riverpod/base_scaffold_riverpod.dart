import 'package:Psynexa/assets.dart';
import 'package:Psynexa/models/bottom_nav_bar_model.dart';
import 'package:Psynexa/view/account.dart';
import 'package:Psynexa/view/favorites.dart';
import 'package:Psynexa/view/home.dart';
import 'package:flutter/material.dart';
import 'package:Psynexa/view/reservation.dart';

class BaseScaffoldRiverpod extends ChangeNotifier {
  List<BottomNavBarModel> items = [
    BottomNavBarModel(
        purple: Assets.icons.icHomePurpleSVG, gray: Assets.icons.icHomeGraySVG),
    BottomNavBarModel(
        purple: Assets.icons.icHeartPurpleSVG,
        gray: Assets.icons.icHeartGraySVG),
    BottomNavBarModel(
        purple: Assets.icons.icClockPurpleSVG,
        gray: Assets.icons.icClockGraySVG),
    BottomNavBarModel(
      purple: Assets.icons.icUserPurpleSVG,
      gray: Assets.icons.icUserGraySVG,
    ),
  ];

  int currentIndex = 0;

  void setCurrentIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  Widget body() {
    switch (currentIndex) {
      case 0:
        return const Home();
      case 1:
        return const Favorites();
      case 2:
        return const Reservation();
      case 3:
        return const Account();
      default:
        return const Home();
    }
  }
}
