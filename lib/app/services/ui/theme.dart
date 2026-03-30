import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
// Slightly lighter surface color
    surface: Color(0xFF1e1e22),
    onSurface: Colors.white,
// More distinguished surface variant
    surfaceContainerHighest: Color(0xFF2d2d32),
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
    surface: Colors.white,
    onSurface: Colors.black,
    surfaceContainerHighest: Color(0xFFF4F4F5),
    onSurfaceVariant: Color.fromARGB(255, 87, 84, 84),
    outline: Color(0xFF656567),
  );

  static final light = ThemeData(
    useMaterial3: true,
    colorScheme: lightTheme,
    brightness: Brightness.light,
    scaffoldBackgroundColor: lightTheme.surface,
    textTheme: GoogleFonts.instrumentSansTextTheme(
      ThemeData(useMaterial3: true, colorScheme: lightTheme).textTheme,
    ),
    primaryTextTheme: GoogleFonts.instrumentSansTextTheme(
      ThemeData(useMaterial3: true, colorScheme: lightTheme).primaryTextTheme,
    ),
  );

  static final dark = ThemeData(
    useMaterial3: true,
    colorScheme: darkTheme,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: darkTheme.surface,
    textTheme: GoogleFonts.instrumentSansTextTheme(
      ThemeData(useMaterial3: true, colorScheme: darkTheme, brightness: Brightness.dark)
          .textTheme,
    ),
    primaryTextTheme: GoogleFonts.instrumentSansTextTheme(
      ThemeData(useMaterial3: true, colorScheme: darkTheme, brightness: Brightness.dark)
          .primaryTextTheme,
    ),
  );
}
