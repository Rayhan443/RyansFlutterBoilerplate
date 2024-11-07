import 'package:flutter/material.dart';
import 'package:ryans_flutter_boilerplate/main/main_view_model.dart';
import 'package:ryans_flutter_boilerplate/presentation/home_page/home_page_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  MainViewModel viewModel = MainViewModel();

  @override
  void initState() {
    viewModel.initTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: viewModel.appTheme,
      builder: (context, theme, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: theme.getTheme(context),
        home: const HomePageUi(),
      ),
    );
  }
}
