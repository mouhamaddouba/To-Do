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
      token: params.token,
      firstName: params.firstName,
      lastName: params.lastName,
      email: params.email,
      id: params.id,
      gender: params.gender,
      image: params.image,
      username: params.username,
      refreshToken: params.refreshToken,
    );
  }
}

class Params {
  final int id;
  final String username;
  final String email;
  final String firstName;
  final String lastName;
  final String gender;
  final String image;
  final String token;
  final String refreshToken;

  Params({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.image,
    required this.username,
    required this.gender,
    required this.refreshToken,
    required this.token,
  });
}
