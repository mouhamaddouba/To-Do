import 'package:easy_localization/easy_localization.dart';
import 'package:to_do/app/core/translations/app_strings.dart';

class ServerException implements Exception {
  final dynamic message;

  ServerException({
    this.message,
  });

  @override
  String toString() {
    Object? message = this.message;
    if (message == null) return AppStrings.serverException.tr();
    return message.toString();
  }
}

class LocalException implements Exception {
  final dynamic message;

  LocalException({
    this.message,
  });

  @override
  String toString() {
    Object? message = this.message;
    if (message == null) return AppStrings.localException.tr();
    return message.toString();
  }
}
