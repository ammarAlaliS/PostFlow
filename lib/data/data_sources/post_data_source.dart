import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:post_flow/domain/entities/post.dart';

abstract class PostRemoteDataSource {
  Future<List<Post>> getPosts(int page, int limit);
}

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  final String _baseUrl = 'https://jsonplaceholder.typicode.com/posts';

  @override
  Future<List<Post>> getPosts(int page, int limit) async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl?_page=$page&_limit=$limit'),
      );

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        return data.map((post) => Post.fromJson(post)).toList();
      } else {
        throw Exception('Error al cargar las publicaciones');
      }
    } catch (e) {
      throw Exception('Error en la petición: $e');
    }
  }
}
