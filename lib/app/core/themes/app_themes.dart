import 'package:flutter/material.dart';
import 'package:to_do/app/core/themes/app_colors.dart';

enum ThemeEnum {
  system,
  light,
  dark,
}

class AppTheme {
  /// current os theme
  final darkMode =
      WidgetsBinding.instance.platformDispatcher.platformBrightness;

  /// current app theme
  static ThemeEnum currentTheme = ThemeEnum.system;

  static final String system = ThemeEnum.system.name;
  static final String light = ThemeEnum.light.name;
  static final String dark = ThemeEnum.dark.name;

  static ThemeData getAppTheme() {
    return _lightTheme();
  }

  static String getAppThemeMode() {
    return ThemeEnum.light.name;
  }

  static ThemeData _lightTheme() {
    return _baseTheme().copyWith();
  }

  static ThemeData _baseTheme() {
    return ThemeData(
      primaryColor: AppColors.primary,
      primaryColorDark: AppColors.darkPrimary,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
}
