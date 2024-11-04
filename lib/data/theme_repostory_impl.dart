import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ryans_flutter_boilerplate/domain/theme_repository.dart';

class ThemeRepositoryImpl extends ThemeRepository {
  static final ThemeRepositoryImpl _instance = ThemeRepositoryImpl._internal();

  factory ThemeRepositoryImpl() {
    return _instance;
  }

  ThemeRepositoryImpl._internal();

  final _storage = const FlutterSecureStorage();
  static const _themeKey = 'app_theme';

  @override
  Future<String?> getStoredTheme() async {
    try {
      return await _storage.read(key: _themeKey);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> saveTheme(String theme) async {
    try {
      await _storage.write(key: _themeKey, value: theme);
    } catch (e) {
      throw Exception(e);
    }
  }
}
