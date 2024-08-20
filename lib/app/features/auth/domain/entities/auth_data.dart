class AuthData {
  final int id;
  final String username;
  final String email;
  final String firstName;
  final String lastName;
  final String gender;
  final String image;
  final String token;
  final String refreshToken;

  AuthData({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.gender,
    required this.image,
    required this.token,
    required this.refreshToken,
    required this.username,
  });

  factory AuthData.fromJson(
    Map<String, dynamic> encodedData,
  ) =>
      AuthData(
        id: encodedData['id'],
        username: encodedData['username'],
        refreshToken: encodedData['refreshToken'],
        email: encodedData['email'],
        gender: encodedData['gender'],
        lastName: encodedData['lastName'],
        token: encodedData['token'],
        firstName: encodedData['firstName'],
        image: encodedData['image'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'username': username,
        'firstName': firstName,
        'token': token,
        'email': email,
        'lastName': lastName,
        'gender': gender,
        'refreshToken': refreshToken,
        'image': image,
      };
}
