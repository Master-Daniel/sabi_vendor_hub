import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sabi_vendor_hub_mobile/app/utils/app_logger.dart';
import 'package:sabi_vendor_hub_mobile/app/utils/top_loader.dart';


class ThemeService extends GetxController {
  static ThemeService get to => Get.find();

  final _box = GetStorage();
  final _key = 'isDarkMode';
  final isDarkMode = false.obs;

  @override
  void onInit() {
    super.onInit();
    _loadThemeFromStorage();
  }

  void _loadThemeFromStorage() {
    try {
      final isDark = _box.read(_key) ??
          Get.mediaQuery.platformBrightness == Brightness.dark;
      isDarkMode.value = isDark;
      Get.changeThemeMode(isDark ? ThemeMode.dark : ThemeMode.light);
    } catch (e) {
      appLog('Error loading theme: $e');
      isDarkMode.value = false;
    }
  }

  Future<void> toggleTheme() async {
    isDarkMode.value = !isDarkMode.value;
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
    _box.write(_key, isDarkMode.value);
    appLog("Theme changed to ${isDarkMode.value ? 'dark' : 'light'}");
    Get.find<LoadingController>().showLoading();
    await Future.delayed(Duration(milliseconds: 300));
    Get.forceAppUpdate();
    Get.forceAppUpdate();
    Get.find<LoadingController>().hideLoading();
  }
}
