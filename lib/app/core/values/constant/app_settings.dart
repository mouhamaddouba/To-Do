import 'package:to_do/app/features/auth/domain/entities/auth_data.dart';

class AppSettings {
  static String version = "0.0.1";

  static String language = 'en';
  static String? token = '';
  static late AuthData user;

  /// Hero Tags
  static const String heroFloatingButton = '000';
}