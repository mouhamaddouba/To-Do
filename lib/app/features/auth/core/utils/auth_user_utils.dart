/*
import 'package:qyam_novers_mobile/app/core/storage/app_storage.dart';

import 'package:to_do/app/features/auth/domain/entities/login_data.dart';

abstract class AuthUserUtils {
  static Future<void> saveLoginData({
    required LoginData loginData,
  }) async {
    return AppStorage.write(
      AppStorage.loginData,
      loginData.toJson(),
    );
  }

  static LoginData? get _loginData {
    final encodedData = AppStorage.read<Map<String, dynamic>?>(
      AppStorage.loginData,
      null,
    );

    if (encodedData == null) {
      return null;
    }

    return LoginData.fromJson(
      encodedData,
    );
  }

  static String get id => _loginData?.id ?? '';

  static String get nickName => _loginData?.nickName ?? '';

  static String get phoneNumber => _loginData?.phoneNumber ?? '';

  static String get parentsWhatsapp => _loginData?.parentsWhatsapp ?? '';

  static String get fatherName => _loginData?.fatherName ?? '';

  static String get fatherMobile => _loginData?.fatherMobile ?? '';

  static String get fatherJob => _loginData?.fatherJob ?? '';

  static String get motherName => _loginData?.motherName ?? '';

  static String get motherMobile => _loginData?.motherMobile ?? '';

  static String get motherJob => _loginData?.motherJob ?? '';

  static String get image => _loginData?.image ?? '';

  static String get token => _loginData?.token ?? '';
}
*/
