import 'package:e_commerce_firebase_getw/screens/categories_screen.dart';
import 'package:e_commerce_firebase_getw/screens/favorites_screen.dart';
import 'package:e_commerce_firebase_getw/screens/home_screen.dart';
import 'package:e_commerce_firebase_getw/screens/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  int currentBottomNavigationIndex = 0;

  final List<Widget> tabs = [
    HomeScreen(),
    CategoriesScreen(),
    FavoritesScreen(),
    SettingScreen(),
  ];

  final List<String> titles = [
    'Home',
    'Categories',
    'Favorites',
    'Settings',
  ];

  void changeBottomNavigationIndex(int index) {
    currentBottomNavigationIndex = index;
    update();
  }
}
