import 'package:post_flow/data/data_sources/commet_data_sources.dart';
import 'package:post_flow/domain/entities/comment.dart'; 
import 'package:post_flow/domain/repositories/comment_repository_interface.dart';

class CommentRepositoryImpl implements CommentRepositoryInterface {
  final CommentRemoteDataSource remoteDataSource;

  CommentRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Comment>> getComments(int postId) async {
    try {
      return await remoteDataSource.getComments(postId);
    } catch (e) {
      throw Exception('Error getting comments: $e');
    }
  }
}
