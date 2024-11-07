import 'package:ryans_flutter_boilerplate/data/theme_repository_impl.dart';
import 'package:ryans_flutter_boilerplate/domain/theme_repository.dart';
import 'package:ryans_flutter_boilerplate/main/main_view_model.dart';
import 'package:ryans_flutter_boilerplate/presentation/enums/app_theme_mode.dart';

class SettingsViewModel {
  SettingsViewModel._internal();
  static final SettingsViewModel _instance = SettingsViewModel._internal();
  factory SettingsViewModel() => _instance;

  final _mainViewModel = MainViewModel();
  get appTheme => _mainViewModel.appTheme;

  final ThemeRepository _themeRepository = ThemeRepositoryImpl();

  bool isSystemMode(AppThemeMode currentTheme) {
    return currentTheme == AppThemeMode.system ||
        currentTheme == AppThemeMode.systemAmoled;
  }

  void handleSystemThemeChange(bool value, bool systemIsDark) {
    if (value) {
      onChangeTheme(AppThemeMode.system);
    } else {
      onChangeTheme(systemIsDark ? AppThemeMode.dark : AppThemeMode.light);
    }
  }

  bool isDarkMode(AppThemeMode currentTheme, bool systemIsDark) {
    return currentTheme == AppThemeMode.dark || currentTheme == AppThemeMode.amoled || (isSystemMode(currentTheme) && systemIsDark);
  }

  void handleDarkModeChange(bool value) {
    onChangeTheme(value ? AppThemeMode.dark : AppThemeMode.light);
  }

  bool isAmoledMode(AppThemeMode currentTheme) {
    return currentTheme == AppThemeMode.amoled || currentTheme == AppThemeMode.systemAmoled;
  }

  void handleAmoledModeChange(bool value, AppThemeMode currentTheme) {
    if (isSystemMode(currentTheme)) {
      onChangeTheme(value ? AppThemeMode.systemAmoled : AppThemeMode.system);
    } else {
      onChangeTheme(value ? AppThemeMode.amoled : AppThemeMode.dark);
    }
  }

  void onChangeTheme(AppThemeMode appThemeMode) {
    _mainViewModel.onThemeChange(appThemeMode);

    _themeRepository.saveTheme(appThemeMode.name);
  }
}
