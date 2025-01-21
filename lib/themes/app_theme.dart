import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// **New:** Create a separate class for app theme data
class AppTheme {
  final ColorScheme colorScheme;
  final TextTheme textTheme;
  final NavigationBarThemeData navigationBarTheme;

  AppTheme({
    required this.colorScheme,
    required this.textTheme,
    required this.navigationBarTheme,
  });

  // **New:** Factory constructor for creating an instance with default values
  factory AppTheme.light() {
    return AppTheme(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.black,
        brightness: Brightness.dark,
        primary: Colors.black,
        onPrimary: Colors.white,
        secondary: Colors.grey[500]!,
        onSecondary: Color(0xFFF9F9FB),
        surface: Color(0xFFFFFFFF),
        onSurface: Colors.black,
      ),
      textTheme: GoogleFonts.poppinsTextTheme(),
      navigationBarTheme: NavigationBarThemeData(
        labelTextStyle: WidgetStateProperty.resolveWith((state) {
          if (state.contains(WidgetState.selected)) {
            return TextStyle(color: Colors.white, fontWeight: FontWeight.bold); // Change this in the future
          }
          return TextStyle(color: Colors.grey[500]!);
        }),
      ),
    );
  }
}

// **New:** Create a function to get the app theme with optional context
AppTheme getAppTheme([BuildContext? context]) {
  // If context is provided, use it for theming (advanced usage)
  // For now, return the default theme
  return AppTheme.light();
}