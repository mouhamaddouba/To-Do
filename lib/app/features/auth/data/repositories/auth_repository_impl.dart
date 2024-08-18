import 'package:dartz/dartz.dart';

import 'package:to_do/app/core/error/exceptions.dart';
import 'package:to_do/app/core/error/failures.dart';
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
    required int id,
    required String username,
    required String email,
    required String firstName,
    required String lastName,
    required String gender,
    required String image,
    required String token,
    required String refreshToken,
  }) async {
    try {
      final result = await _remoteDatasource.login(
        data: LoginRequestDto(
          id: id,
          username: username,
          lastName: lastName,
          firstName: firstName,
          gender: gender,
          token: token,
          refreshToken: refreshToken,
          email: email,
          image: image,
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
