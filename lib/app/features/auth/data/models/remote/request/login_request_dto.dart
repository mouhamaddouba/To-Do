class LoginRequestDto {
  final String phoneNumber;
  final String email;
  final String password;
  final bool remeberMe;
  final bool byEmail;

  LoginRequestDto({
    required this.phoneNumber,
    required this.password,
    required this.email,
    required this.remeberMe,
    required this.byEmail,
  });

  Map<String, dynamic> toJson() => <String, dynamic>{
        'email': email,
        'phoneNumber': phoneNumber,
        'password': password,
        'remeberMe': remeberMe,
        'byEmail': byEmail,
      };
}
