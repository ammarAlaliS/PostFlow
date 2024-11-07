import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:post_flow/data/models/user_model.dart';

abstract class UserRemoteDataSource {
  Future<UserModel> getUser();
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final http.Client client;

  UserRemoteDataSourceImpl({required this.client});

  @override
  Future<UserModel> getUser() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/users/1');
    
    final response = await client.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return UserModel.fromJson(data);
    } else {
      throw Exception('Failed to load user');
    }
  }
}
