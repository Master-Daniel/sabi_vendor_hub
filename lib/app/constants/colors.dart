import 'package:flutter/material.dart';

class AppColors {
  /// Splash / brand background anchor (paired with [splashGradientEnd]).
  static const Color splashGradientStart = Color(0xFF1E1226);
  static const Color splashGradientEnd = Color(0xFF120A18);

  /// Bottom-right blur wash on splash (`#F4EFFD` @ ~12% — `0x1FF4EFFD`).
  static const Color splashBlurTint = Color(0x1FF4EFFD);

  /// Auth screens (e.g. login) scaffold background.
  static const Color authBackground = Color(0xFFF3F3F3);

  /// Email field fill (off‑white).
  static const Color authFieldFill = Color(0xFFFEFEFE);

  /// Brand purple — buttons on light screens & tappable legal links (matches splash anchor).
  static const Color brandPurple = splashGradientStart;

  static const Color primary = Color(0xFF003C42);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color grey = Color.fromARGB(255, 87, 84, 84);
  static const Color lightGrey = Color.fromARGB(255, 235, 235, 236);
  static const Color red = Color.fromARGB(255, 193, 6, 53);
  static const Color warning = Color(0XFFF5A524);
}
 