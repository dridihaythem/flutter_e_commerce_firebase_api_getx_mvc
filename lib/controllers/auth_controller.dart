import 'package:get/get.dart';

class AuthController extends GetxController {
  bool isPasswordVisible = false;

  bool isChecked = false;

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    update();
  }

  void toggleCheckbox() {
    isChecked = !isChecked;
    update();
  }
}
