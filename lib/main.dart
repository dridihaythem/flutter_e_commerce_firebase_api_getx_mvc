import 'package:e_commerce_firebase_getw/controllers/theme_controller.dart';
import 'package:e_commerce_firebase_getw/routes.dart';
import 'package:e_commerce_firebase_getw/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        appBarTheme: AppBarTheme(
          color: mainColor,
        ),
        scaffoldBackgroundColor: Colors.white,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.black,
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(
          color: darkGreyClr,
        ),
        scaffoldBackgroundColor: darkGreyClr,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: darkGreyClr,
          selectedItemColor: Colors.green,
          selectedIconTheme: IconThemeData(color: Colors.green),
          unselectedItemColor: Colors.green.withOpacity(0.75),
        ),
      ),
      themeMode:
          ThemeController.isDarkMode() ? ThemeMode.dark : ThemeMode.light,
      initialRoute: AppRoutes.initialRoute,
      getPages: AppRoutes.routes,
    );
  }
}
