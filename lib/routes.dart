import 'package:e_commerce_firebase_getw/screens/auth/login_screen.dart';
import 'package:e_commerce_firebase_getw/screens/auth/signup_screen.dart';
import 'package:e_commerce_firebase_getw/screens/welcome_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const initialRoute = '/welcome';

  static final routes = [
    GetPage(
      name: '/welcome',
      page: () => WelcomeScreen(),
    ),
    GetPage(
      name: '/login',
      page: () => LoginScreen(),
    ),
    GetPage(
      name: '/signup',
      page: () => SignupScreen(),
    ),
  ];
}
