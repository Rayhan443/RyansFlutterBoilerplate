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
        final isDarkMode = currentTheme != AppThemeMode.light;
        final isSystemMode = currentTheme == AppThemeMode.system;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const SectionHeader(title: 'Appearance'),
            _systemThemeButton(context, isSystemMode),
            if (!isSystemMode) _darkModeButton(context, isDarkMode),
            if (isDarkMode) _amoledDarkMode(context, currentTheme),
          ],
        );
      },
    );
  }

  Widget _systemThemeButton(BuildContext context, bool isDarkMode) {
    return ListTile(
      title: const Text('System'),
      subtitle: Text(isDarkMode ? 'On' : 'Off'),
      trailing: Switch(
        value: isDarkMode,
        onChanged: (value) {
          _viewModel.onChangeTheme(
            value ? AppThemeMode.system : AppThemeMode.light,
          );
        },
      ),
    );
  }

  Widget _darkModeButton(BuildContext context, bool isDarkMode) {
    return ListTile(
      title: const Text('Dark Mode'),
      subtitle: Text(isDarkMode ? 'On' : 'Off'),
      trailing: Switch(
        value: isDarkMode,
        onChanged: (value) {
          _viewModel.onChangeTheme(
            value ? AppThemeMode.dark : AppThemeMode.light,
          );
        },
      ),
    );
  }

  Widget _amoledDarkMode(BuildContext context, AppThemeMode currentTheme) {
    return ListTile(
      title: const Text('AMOLED Dark Mode'),
      subtitle: const Text('Pure black theme for OLED displays'),
      trailing: Switch(
        value: currentTheme == AppThemeMode.amoled,
        onChanged: (value) {
          _viewModel.onChangeTheme(
            value ? AppThemeMode.amoled : AppThemeMode.dark,
          );
        },
      ),
    );
  }
}
