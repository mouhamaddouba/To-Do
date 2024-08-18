class LoginRequestDto {
  final int id;
  final String username;
  final String email;
  final String firstName;
  final String lastName;
  final String gender;
  final String image;
  final String token;
  final String refreshToken;

  LoginRequestDto({
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

  Map<String, dynamic> toJson() => <String, dynamic>{
        'email': email,
        'id': id,
        'firstName': firstName,
        'lastName': lastName,
        'image': image,
        'username': username,
        'gender': gender,
        'refreshToken': refreshToken,
        'token': token,
      };
}
