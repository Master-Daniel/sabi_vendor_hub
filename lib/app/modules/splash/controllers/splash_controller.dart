import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../constants/colors.dart';

/// Splash-only UI constants. Navigation runs from [SplashView] with [Navigator],
/// not GetX shortcuts, so the real navigator stack always updates.
abstract final class SplashScreenUi {
  static const SystemUiOverlayStyle overlay = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: AppColors.splashGradientEnd,
    systemNavigationBarIconBrightness: Brightness.light,
  );

  static void applyPostSplashOverlay() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: const Color(0xFFFAFAFA),
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
  }
}
