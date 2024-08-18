import 'package:dartz/dartz.dart';

import 'package:to_do/app/core/error/failures.dart';

import '../entities/login_data.dart';

abstract class AuthRepository {
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
  });
}
