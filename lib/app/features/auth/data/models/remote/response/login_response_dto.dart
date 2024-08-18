import 'package:to_do/app/features/auth/domain/entities/login_data.dart';

class LoginResponseDto extends LoginData {
  LoginResponseDto({
    required super.id,
    required super.username,
    required super.email,
    required super.firstName,
    required super.lastName,
    required super.gender,
    required super.image,
    required super.token,
    required super.refreshToken,
  });

  factory LoginResponseDto.fromJson(
    Map<String, dynamic> json,
  ) =>
      LoginResponseDto(
        id: json['id'],
        username: json['username'],
        refreshToken: json['refreshToken'],
        email: json['email'],
        gender: json['gender'],
        lastName: json['lastName'],
        token: json['token'],
        firstName: json['firstName'],
        image: json['image'],
      );
}
