import 'package:e_commerce_firebase_getw/bindings/auth_binding.dart';
import 'package:e_commerce_firebase_getw/bindings/main_binding.dart';
import 'package:e_commerce_firebase_getw/bindings/product_binding.dart';
import 'package:e_commerce_firebase_getw/screens/auth/forget_password_screen.dart';
import 'package:e_commerce_firebase_getw/screens/auth/login_screen.dart';
import 'package:e_commerce_firebase_getw/screens/auth/signup_screen.dart';
import 'package:e_commerce_firebase_getw/screens/cart_screen.dart';
import 'package:e_commerce_firebase_getw/screens/home_screen.dart';
import 'package:e_commerce_firebase_getw/screens/main_screen.dart';
import 'package:e_commerce_firebase_getw/screens/welcome_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const initialRoute = '/welcome';
  static const mainRoute = '/main';

  static final routes = [
    GetPage(
      name: '/welcome',
      page: () => WelcomeScreen(),
    ),
    GetPage(
      name: '/login',
      page: () => LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: '/signup',
      page: () => SignupScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: '/forget-password',
      page: () => ForgetPasswordScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: '/main',
      page: () => MainScreen(),
      bindings: [
        AuthBinding(),
        ProductBinding(),
        MainBinding(),
      ],
    ),
    GetPage(
      name: '/cart',
      page: () => CardScreen(),
      bindings: [],
    ),
  ];
}
