part of 'auth_bloc.dart';

class AuthEvent {}

class Login extends AuthEvent {
  final String username;
  final String password;

  Login({required this.username, required this.password});
}
