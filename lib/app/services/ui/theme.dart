import 'package:flutter/material.dart';

class AppTheme {
  static const darkTheme = ColorScheme.dark(
// Keeping your original primary color
    primary: Color(0xFF77b0aa),
    onPrimary: Colors.white,
// Lightened primary container for better visibility
    primaryContainer: Color(0xFF1a3d42),
    onPrimaryContainer: Colors.white,

    secondary: Color(0xFF77b0aa),
    onSecondary: Colors.black,
// Slightly lightened secondary container
    secondaryContainer: Color(0xFF5a857f),
    onSecondaryContainer: Colors.white,

    error: Color(0xFFF21158),
    onError: Colors.white,
    errorContainer: Color(0xFF9d0b39),
    onErrorContainer: Colors.white,

// Lightened background for better readability
    background: Color(0xFF121212),
    onBackground: Colors.white,
// Slightly lighter surface color
    surface: Color(0xFF1e1e22),
    onSurface: Colors.white,
// More distinguished surface variant
    surfaceVariant: Color(0xFF2d2d32),
    onSurfaceVariant: Color.fromARGB(255, 235, 235, 236),
// Lighter outline for better contrast
    outline: Color(0xFF8a8a8a),
  );
  static final lightTheme = ColorScheme.light(
    primary: Color(0xFF003c43),
    onPrimary: Colors.white,
    primaryContainer: Color(0xFF2d5e64),
    onPrimaryContainer: Colors.white,
    secondary: Color(0xFF77b0aa),
    onSecondary: Colors.black,
    secondaryContainer: Color(0xFF4d726f),
    onSecondaryContainer: Colors.white,
    error: Color(0xFFF21158),
    onError: Colors.white,
    errorContainer: Color(0xFF9d0b39),
    onErrorContainer: Colors.white,
    background: Colors.white,
    onBackground: Colors.black,
    surface: Colors.white,
    onSurface: Colors.black,
    surfaceVariant: Color(0xFFF4F4F5),
    onSurfaceVariant: Color.fromARGB(255, 87, 84, 84),
    outline: Color(0xFF656567),
  );

  static final light = ThemeData(
    useMaterial3: true,
    fontFamily: 'outfit',
    colorScheme: lightTheme,
    brightness: Brightness.light,
    scaffoldBackgroundColor: lightTheme.background,
  );

  static final dark = ThemeData(
    useMaterial3: true,
    fontFamily: 'outfit',
    colorScheme: darkTheme,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: darkTheme.surface,
  );
}
