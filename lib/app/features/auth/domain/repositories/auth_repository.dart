import 'package:dartz/dartz.dart';

import 'package:to_do/app/core/error/failures.dart';

import '../entities/login_data.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserData>> login({
    required String username,
    required String password,
  });
}
