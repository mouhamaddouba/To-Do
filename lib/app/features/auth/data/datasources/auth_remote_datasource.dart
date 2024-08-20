import 'package:to_do/app/core/error/exceptions.dart';
import 'package:to_do/app/core/network/api_provider.dart';
import 'package:to_do/app/core/network/app_urls.dart';

import 'package:to_do/app/core/network_response/network_response.dart';
import 'package:to_do/app/features/auth/data/models/remote/request/auth_request_dto.dart';
import 'package:to_do/app/features/auth/data/models/remote/response/auth_response_dto.dart';

abstract class AuthRemoteDatasource {
  Future<AuthResponseDto?> login({
    required AuthRequestDto data,
  });
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  @override
  Future<AuthResponseDto?> login({
    required AuthRequestDto data,
  }) async {
    AuthResponseDto? result;

    await ApiProvider.post(
      token: '',
      url: AppUrls.login,
      data: data.toJson(),
      onSuccess: (dynamic data) {
        final networkResponse = NetworkResponse.fromJson<AuthResponseDto>(
          data,
          AuthResponseDto.fromJson,
        );

        if (!networkResponse.succeeded) {
          throw ServerException(
            message: networkResponse.message,
          );
        }

        result = networkResponse.data;
      },
      onError: (String errorMessage) {
        throw ServerException(
          message: errorMessage,
        );
      },
    );

    return result;
  }
}
