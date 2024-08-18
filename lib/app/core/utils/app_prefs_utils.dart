import 'package:to_do/app/core/storage/app_shared_prefrence.dart';
import 'package:to_do/app/core/storage/app_storage_keys.dart';
import 'package:to_do/app/core/themes/app_themes.dart';

class AppPrefs {
  AppPrefs._internal();

  static final AppPrefs _instance = AppPrefs._internal();
  factory AppPrefs() => _instance;

  late String _theme;
  String get appTheme => _theme;

  Future<void> init() async {
    _theme = await AppSharedPreferences().read(AppStorageKeys.theme) ??
        ThemeEnum.system.name;
  }

  Future<void> setAppTheme(String theme) async {
    _theme = theme;
    await AppSharedPreferences().write(
      AppStorageKeys.theme,
      theme,
    );
  }
}
