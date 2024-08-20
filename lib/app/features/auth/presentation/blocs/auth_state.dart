part of 'auth_bloc.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthLoaded extends AuthState {
  AuthLoaded();
}

class AuthLoadError extends AuthState {
  final Failure failure;

  AuthLoadError({
    required this.failure,
  });
}
