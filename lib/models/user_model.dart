class UserModel {
  final String name;
  final String email;

  UserModel({required this.name, required this.email});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
    );
  }
}

class LoginResponse {
  final bool success;
  final UserModel user;
  final String token;

  LoginResponse({required this.success, required this.user, required this.token});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      success: json['success'],
      user: UserModel.fromJson(json['user']),
      token: json['token'],
    );
  }
}
