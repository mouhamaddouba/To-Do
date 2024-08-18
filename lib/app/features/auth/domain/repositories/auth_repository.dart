import 'package:dartz/dartz.dart';

import 'package:to_do/app/core/error/failures.dart';

import '../entities/login_data.dart';

abstract class AuthRepository {
  Future<Either<Failure, LoginData>> login({
    required String phoneNumber,
    required String password,
    required bool rememberMe,
    required String email,
    required bool byEmail,
  });
}
