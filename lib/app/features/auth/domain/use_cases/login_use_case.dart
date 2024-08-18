import 'package:dartz/dartz.dart';
import 'package:to_do/app/core/error/failures.dart';
import 'package:to_do/app/core/use_case/use_case.dart';
import 'package:to_do/app/features/auth/domain/entities/login_data.dart';
import 'package:to_do/app/features/auth/domain/repositories/auth_repository.dart';

class LoginUseCase extends UseCase<LoginData, Params> {
  final AuthRepository _repository;

  LoginUseCase({
    required AuthRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<Failure, LoginData>> call(Params params) {
    return _repository.login(
      username: params.username,
      password: params.password,
    );
  }
}

class Params {
  final String username;
  final String password;

  Params({
    required this.username,
    required this.password,
  });
}
