import 'package:flutter/material.dart';
import 'package:ryans_flutter_boilerplate/presentation/theme/app_theme.dart';

enum AppThemeMode {
  system,
  light,
  dark,
  amoled;

  ThemeData getTheme(BuildContext context) => switch (this) {
        AppThemeMode.system => AppTheme.systemTheme(context),
        AppThemeMode.light => AppTheme.lightTheme(),
        AppThemeMode.dark => AppTheme.darkTheme(),
        AppThemeMode.amoled => AppTheme.amoledDarkTheme(),
      };

  String get name => switch (this) {
        AppThemeMode.system => 'system',
        AppThemeMode.light => 'light',
        AppThemeMode.dark => 'dark',
        AppThemeMode.amoled => 'amoled',
      };
}
