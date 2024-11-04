import 'package:flutter/foundation.dart';
import 'package:ryans_flutter_boilerplate/presentation/enums/app_theme_mode.dart';

class MainViewModel {
  MainViewModel._internal();

  static final MainViewModel _instance = MainViewModel._internal();

  factory MainViewModel() {
    return _instance;
  }

  final ValueNotifier<AppThemeMode> _appTheme = ValueNotifier(AppThemeMode.light);
  ValueListenable<AppThemeMode> get appTheme => _appTheme;

  void onThemeChange(AppThemeMode appThemeMode) {
    if(_appTheme.value != appThemeMode) {
      _appTheme.value = appThemeMode;
    }
  }
}
