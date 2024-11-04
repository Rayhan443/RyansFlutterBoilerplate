import 'package:ryans_flutter_boilerplate/main/main_view_model.dart';
import 'package:ryans_flutter_boilerplate/presentation/enums/app_theme_mode.dart';

class SettingsViewModel {
  SettingsViewModel._internal();

  static final SettingsViewModel _instance = SettingsViewModel._internal();

  factory SettingsViewModel() {
    return _instance;
  }

  final _mainViewModel = MainViewModel();

  get appTheme => _mainViewModel.appTheme;

  void onChangeTheme(AppThemeMode appThemeMode) {
    _mainViewModel.onThemeChange(appThemeMode);
  }
}
