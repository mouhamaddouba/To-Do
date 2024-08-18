import 'package:dartz/dartz.dart';

import 'package:to_do/app/core/error/exceptions.dart';
import 'package:to_do/app/core/error/failures.dart';
import 'package:to_do/app/core/utils/app_network_utils.dart';
import 'package:to_do/app/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:to_do/app/features/auth/data/models/remote/request/login_request_dto.dart';
import 'package:to_do/app/features/auth/domain/entities/login_data.dart';
import 'package:to_do/app/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource _remoteDatasource;

  AuthRepositoryImpl({
    required AuthRemoteDatasource remoteDatasource,
  }) : _remoteDatasource = remoteDatasource;

  @override
  Future<Either<Failure, LoginData>> login({
    required String phoneNumber,
    required String password,
    required bool rememberMe,
    required String email,
    required bool byEmail,
  }) async {
    try {
      if (await AppNetworkUtilsImpl.instance.isConnected) {
        final result = await _remoteDatasource.login(
          data: LoginRequestDto(
            phoneNumber: phoneNumber,
            password: password,
            remeberMe: rememberMe,
            email: email,
            byEmail: byEmail,
          ),
        );

        return Right(
          result!,
        );
      }

      return Left(
        NoInternetConnectionFailure(),
      );
    } on ServerException catch (exception) {
      return Left(
        ServerFailure(
          message: exception.message,
        ),
      );
    } on LocalException catch (exception) {
      return Left(
        LocalFailure(
          message: exception.message,
        ),
      );
    }
  }
}
