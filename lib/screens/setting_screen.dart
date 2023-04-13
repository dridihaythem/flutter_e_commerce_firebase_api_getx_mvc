import 'package:e_commerce_firebase_getw/controllers/auth_controller.dart';
import 'package:e_commerce_firebase_getw/controllers/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({super.key});

  final _authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        ElevatedButton(
          onPressed: () {
            ThemeController.changeTheme();
            if (ThemeController.isDarkMode()) {
              Get.changeThemeMode(ThemeMode.dark);
            } else {
              Get.changeThemeMode(ThemeMode.light);
            }
          },
          child: Text('Switch mode'),
        ),
        ElevatedButton(
          onPressed: () {
            Get.defaultDialog(
              title: 'Logout',
              middleText: 'Are you sure you want to logout?',
              onConfirm: () {
                _authController.logout();
              },
              onCancel: () {},
            );
          },
          child: Text('Logout'),
        )
      ],
    ));
  }
}
