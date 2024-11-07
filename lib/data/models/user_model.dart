import 'package:post_flow/domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    required String name,
    required String email,
    required String avatarUrl,
  }) : super(name: name, email: email, avatarUrl: avatarUrl);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      avatarUrl: json['avatarUrl'] ?? 'https://www.example.com/default-avatar.png', // URL por defecto si no está disponible
    );
  }
}
