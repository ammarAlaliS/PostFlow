import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:post_flow/data/models/user_model.dart';

class UserRemoteDataSource {
  final String baseUrl;

  UserRemoteDataSource({required this.baseUrl});

  Future<UserModel> getUser(int userId) async {
    final response = await http.get(Uri.parse('$baseUrl/users/$userId'));

    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load user');
    }
  }
}
