import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../constants/colors.dart';
import '../../../../routes/app_pages.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();

  /// `true` when non-empty and matches a basic email pattern.
  final isEmailValid = false.obs;

  /// `true` when there is input that does not match the email pattern.
  final showEmailError = false.obs;

  static final RegExp _emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  /// Match scaffold `#F3F3F3` so the status bar is not a separate white band on Android.
  static const SystemUiOverlayStyle lightAuthSystemUi = SystemUiOverlayStyle(
    statusBarColor: AppColors.authBackground,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: AppColors.authBackground,
    systemNavigationBarIconBrightness: Brightness.dark,
  );

  @override
  void onInit() {
    super.onInit();
    SystemChrome.setSystemUIOverlayStyle(lightAuthSystemUi);
    emailController.addListener(_syncEmailValidity);
    _syncEmailValidity();
  }

  void _syncEmailValidity() {
    final raw = emailController.text.trim();
    final matches = _emailRegex.hasMatch(raw);
    isEmailValid.value = raw.isNotEmpty && matches;
    showEmailError.value = raw.isNotEmpty && !matches;
  }

  @override
  void onClose() {
    emailController.removeListener(_syncEmailValidity);
    emailController.dispose();
    super.onClose();
  }

  void onContinueWithEmail() {
    if (!isEmailValid.value) return;
    Get.toNamed<void>(
      Routes.OTP,
      arguments: emailController.text.trim(),
    );
  }

  void onContinueWithApple() {
    // TODO: Apple Sign-In
  }

  void onContinueWithGoogle() {
    // TODO: Google Sign-In
  }

  void openTermsOfService() {
    // TODO: open Terms URL or in-app page
  }

  void openPrivacyPolicy() {
    // TODO: open Privacy URL or in-app page
  }
}
