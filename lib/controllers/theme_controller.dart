import 'package:get_storage/get_storage.dart';

class ThemeController {
  static GetStorage box = GetStorage();

  static bool isDarkMode() {
    return ThemeController.box.read<bool>('isDarkMode') ?? false;
  }

  static void changeTheme() {
    ThemeController.box.write('isDarkMode', isDarkMode() ? false : true);
  }
}
