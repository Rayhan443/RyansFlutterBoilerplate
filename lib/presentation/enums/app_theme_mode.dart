import 'package:flutter/material.dart';
import 'package:ryans_flutter_boilerplate/presentation/theme/app_theme.dart';

enum AppThemeMode {
  system,
  systemAmoled, // New mode for system + AMOLED
  light,
  dark,
  amoled;

  ThemeData getTheme(BuildContext context) => switch (this) {
    AppThemeMode.system => AppTheme.systemTheme(context),
    AppThemeMode.systemAmoled => AppTheme.systemAmoledTheme(context), // New theme method
    AppThemeMode.light => AppTheme.lightTheme(),
    AppThemeMode.dark => AppTheme.darkTheme(),
    AppThemeMode.amoled => AppTheme.amoledDarkTheme(),
  };

  String get name => switch (this) {
    AppThemeMode.system => 'system',
    AppThemeMode.systemAmoled => 'system_amoled',
    AppThemeMode.light => 'light',
    AppThemeMode.dark => 'dark',
    AppThemeMode.amoled => 'amoled',
  };
}