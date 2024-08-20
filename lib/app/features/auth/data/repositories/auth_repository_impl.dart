import 'package:dartz/dartz.dart';

import 'package:to_do/app/core/error/exceptions.dart';
import 'package:to_do/app/core/error/failures.dart';
import 'package:to_do/app/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:to_do/app/features/auth/data/models/remote/request/auth_request_dto.dart';
import 'package:to_do/app/features/auth/domain/entities/auth_data.dart';
import 'package:to_do/app/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource _remoteDatasource;

  AuthRepositoryImpl({
    required AuthRemoteDatasource remoteDatasource,
  }) : _remoteDatasource = remoteDatasource;

  @override
  Future<Either<Failure, AuthData>> login({
    required String username,
    required String password,
  }) async {
    try {
      final result = await _remoteDatasource.login(
        data: AuthRequestDto(
          username: username,
          password: password,
        ),
      );

      return Right(
        result!,
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
