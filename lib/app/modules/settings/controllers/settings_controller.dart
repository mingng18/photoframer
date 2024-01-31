import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photoframer/app/global.dart';

class SettingsController extends GetxController {
  
  void toggleDarkMode() {
    GlobalService.to.switchThemeModel();
    Get.changeThemeMode(
      GlobalService.to.isDarkMode ? ThemeMode.dark : ThemeMode.light,
    );
  }
}
