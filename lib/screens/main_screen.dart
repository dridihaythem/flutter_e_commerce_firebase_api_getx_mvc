import 'package:e_commerce_firebase_getw/controllers/cart_controller.dart';
import 'package:e_commerce_firebase_getw/controllers/main_controller.dart';
import 'package:e_commerce_firebase_getw/controllers/theme_controller.dart';
import 'package:e_commerce_firebase_getw/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final _mainController = Get.find<MainController>();
  final _cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: GetBuilder<MainController>(builder: (context) {
          return Text(
            _mainController
                .titles[_mainController.currentBottomNavigationIndex],
          ); // 'Home
        }),
        actions: [
          Stack(
            children: [
              IconButton(
                onPressed: () {
                  ThemeController.changeTheme();
                  // if (ThemeController.isDarkMode()) {
                  //   Get.changeThemeMode(ThemeMode.dark);
                  // } else {
                  //   Get.changeThemeMode(ThemeMode.light);
                  // }
                  Get.toNamed('/cart');
                },
                icon: Image.asset('assets/images/shop.png'),
              ),
              Obx(
                () => Visibility(
                  visible: _cartController.cartItemsCount > 0,
                  child: Positioned(
                    top: -2,
                    right: 0,
                    child: CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.red,
                      child: Text(_cartController.cartItemsCount.toString()),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      bottomNavigationBar: GetBuilder<MainController>(builder: (context) {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed, // Fixed

          currentIndex: _mainController.currentBottomNavigationIndex,
          onTap: (index) {
            _mainController.changeBottomNavigationIndex(index);
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              activeIcon: Icon(
                Icons.home,
                color: mainColor,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Categories',
              activeIcon: Icon(
                Icons.category,
                color: mainColor,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorites',
              activeIcon: Icon(
                Icons.favorite,
                color: mainColor,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
              activeIcon: Icon(
                Icons.settings,
                color: mainColor,
              ),
            ),
          ],
        );
      }),
      body: GetBuilder<MainController>(builder: (context) {
        return _mainController
            .tabs[_mainController.currentBottomNavigationIndex];
      }),
    );
  }
}
