import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:post_flow/data/models/commet_model.dart';
import 'package:post_flow/domain/entities/comment.dart'; 

abstract class CommentRemoteDataSource {
  Future<List<Comment>> getComments(int postId);
}

class CommentRemoteDataSourceImpl implements CommentRemoteDataSource {

  @override
  Future<List<Comment>> getComments(int postId) async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/comments?postId=$postId');
    final response = await http.get(url); 

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => CommentModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load comments');
    }
  }
}
