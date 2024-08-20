class AuthRequestDto {
  final String username;
  final String password;

  AuthRequestDto({
    required this.username,
    required this.password,
  });

  Map<String, dynamic> toJson() => <String, dynamic>{
        'username': username,
        'password': password,
      };
}
