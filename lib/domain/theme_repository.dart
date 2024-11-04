abstract class ThemeRepository {
  Future<String?> getStoredTheme();
  Future<void> saveTheme(String theme);
}