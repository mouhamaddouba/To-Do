import 'package:dartz/dartz.dart';

import 'package:to_do/app/core/error/failures.dart';

import '../entities/auth_data.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthData>> login({
    required String username,
    required String password,
  });
}
