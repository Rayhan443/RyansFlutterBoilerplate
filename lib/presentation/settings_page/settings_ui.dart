import 'package:flutter/material.dart';
import 'package:ryans_flutter_boilerplate/presentation/enums/app_theme_mode.dart';
import 'package:ryans_flutter_boilerplate/presentation/settings_page/settings_view_model.dart';
import 'package:ryans_flutter_boilerplate/presentation/settings_page/widgets/section_header.dart';

class SettingsUi extends StatefulWidget {
  const SettingsUi({super.key});

  @override
  State<SettingsUi> createState() => _SettingsUiState();
}

class _SettingsUiState extends State<SettingsUi> {
  final SettingsViewModel _viewModel = SettingsViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _themeModeButtons(context),
        ],
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text("Settings"),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }

  Widget _themeModeButtons(BuildContext context) {
    return ValueListenableBuilder<AppThemeMode>(
      valueListenable: _viewModel.appTheme,
      builder: (context, currentTheme, _) {
        final systemIsDark = MediaQuery.of(context).platformBrightness == Brightness.dark;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const SectionHeader(title: 'Appearance'),
            _systemThemeButton(context, currentTheme, systemIsDark),
            _lightDarkModeButton(context, currentTheme, systemIsDark),
            _amoledDarkModeButton(context, currentTheme, systemIsDark),
          ],
        );
      },
    );
  }

  Widget _systemThemeButton(BuildContext context, AppThemeMode currentTheme, bool systemIsDark) {
    return ListTile(
      title: const Text('System'),
      subtitle: Text(_viewModel.isSystemMode(currentTheme) ? 'On' : 'Off'),
      trailing: Switch(
        value: _viewModel.isSystemMode(currentTheme),
        onChanged: (value) => _viewModel.handleSystemThemeChange(value, systemIsDark),
      ),
    );
  }

  Widget _lightDarkModeButton(BuildContext context, AppThemeMode currentTheme, bool systemIsDark) {
    return ListTile(
      enabled: !_viewModel.isSystemMode(currentTheme),
      title: const Text('Dark Mode'),
      subtitle: Text(_viewModel.isDarkMode(currentTheme, systemIsDark) ? 'On' : 'Off'),
      trailing: Switch(
        value: _viewModel.isDarkMode(currentTheme, systemIsDark),
        onChanged: _viewModel.isSystemMode(currentTheme) ? null : _viewModel.handleDarkModeChange,
      ),
    );
  }

  Widget _amoledDarkModeButton(BuildContext context, AppThemeMode currentTheme, bool systemIsDark) {
    final isDarkMode = _viewModel.isDarkMode(currentTheme, systemIsDark);

    return ListTile(
      enabled: isDarkMode,
      title: const Text('AMOLED Dark Mode'),
      subtitle: const Text('Pure black theme for OLED displays'),
      trailing: Switch(
        value: _viewModel.isAmoledMode(currentTheme),
        onChanged: isDarkMode ? (value) => _viewModel.handleAmoledModeChange(value, currentTheme) : null,
      ),
    );
  }
}