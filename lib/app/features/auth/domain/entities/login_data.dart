class LoginData {
  final int id;
  final String username;
  final String email;
  final String firstName;
  final String lastName;
  final String gender;
  final String image;
  final bool token;
  final bool refreshToken;

  LoginData({
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

  factory LoginData.fromJson(
    Map<String, dynamic> encodedData,
  ) =>
      LoginData(
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