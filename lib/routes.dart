import 'package:e_commerce_firebase_getw/screens/welcome_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const initialRoute = '/welcome';

  static final routes = [
    GetPage(
      name: '/welcome',
      page: () => WelcomeScreen(),
    ),
  ];
}
