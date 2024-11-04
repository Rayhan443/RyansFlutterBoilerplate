import 'package:flutter/material.dart';
import 'package:ryans_flutter_boilerplate/main/main_view_model.dart';
import 'package:ryans_flutter_boilerplate/presentation/enums/app_theme_mode.dart';
import 'package:ryans_flutter_boilerplate/presentation/settings_page/settings_ui.dart';

class HomePageUi extends StatefulWidget {
  const HomePageUi({super.key});

  @override
  State<HomePageUi> createState() => _HomePageUiState();
}

class _HomePageUiState extends State<HomePageUi> {
  late final MainViewModel viewModel;
  @override
  void initState() {
    viewModel = MainViewModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
      ),
      body: Center(
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Theme.of(context).colorScheme.onPrimary),
          ),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SettingsUi(),
            ),
          ),
          child: Text('Hello'),
        ),
      ),
    );
  }
}
