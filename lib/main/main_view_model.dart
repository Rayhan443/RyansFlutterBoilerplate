import 'package:flutter/foundation.dart';
import 'package:ryans_flutter_boilerplate/data/theme_repository_impl.dart';
import 'package:ryans_flutter_boilerplate/domain/theme_repository.dart';
import 'package:ryans_flutter_boilerplate/presentation/enums/app_theme_mode.dart';

class MainViewModel {
  MainViewModel._internal();

  static final MainViewModel _instance = MainViewModel._internal();

  factory MainViewModel() {
    return _instance;
  }

  final ThemeRepository _themeRepository = ThemeRepositoryImpl();

  final ValueNotifier<AppThemeMode> _appTheme = ValueNotifier(AppThemeMode.light);
  ValueListenable<AppThemeMode> get appTheme => _appTheme;

  Future<void> initTheme() async {
    try {
      final storedTheme = await _themeRepository.getStoredTheme();
      if (storedTheme != null) {
        final themeMode = AppThemeMode.values.firstWhere(
          (e) => e.name == storedTheme,
          orElse: () => AppThemeMode.system,
        );
        _appTheme.value = themeMode;
      }
    } catch (e) {
      _appTheme.value = AppThemeMode.system;
    }
  }

  void onThemeChange(AppThemeMode appThemeMode) {
    if (_appTheme.value != appThemeMode) {
      _appTheme.value = appThemeMode;
    }
  }
}
