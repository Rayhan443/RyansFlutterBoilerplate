import 'package:flutter/material.dart';
import 'package:ryans_flutter_boilerplate/presentation/theme/color_schemes.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: AppSchemes.lightScheme,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppSchemes.lightScheme.surface,
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: AppSchemes.darkScheme,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppSchemes.darkScheme.surface,
    );
  }

  static ThemeData amoledDarkTheme() {
    final darkScheme = AppSchemes.darkScheme.copyWith(
      surface: Colors.black,
      surfaceContainerLow: Colors.black,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: darkScheme,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Colors.black,
    );
  }

  static ThemeData systemTheme(BuildContext context) {
    final brightness = MediaQuery.platformBrightnessOf(context);
    return brightness == Brightness.light ? lightTheme() : darkTheme();
  }
}
