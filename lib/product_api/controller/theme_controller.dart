import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ThemeController extends GetxController {
  static ThemeController get to => Get.put(ThemeController());

  Rx<ThemeMode> _themeMode = ThemeMode.light.obs;

  ThemeMode get themeMode => _themeMode.value;

  bool get isDarkMode => _themeMode.value == ThemeMode.dark;

  void toggleTheme() {
    if (_themeMode.value == ThemeMode.light) {
      _themeMode.value = ThemeMode.dark;
    } else {
      _themeMode.value = ThemeMode.light;
    }
    Get.changeThemeMode(_themeMode.value);
  }

  Color get textColor => isDarkMode ? Colors.white : Colors.black;
}
