import 'package:post_flow/domain/repositories/comment_repository_interface.dart';
import 'package:post_flow/domain/entities/comment.dart';

class GetPostCommentUseCase {
  final CommentRepositoryInterface commentRepositoryInterface;

  // Eliminamos el parámetro postId del constructor.
  GetPostCommentUseCase({
    required this.commentRepositoryInterface,
  });

  // El parámetro postId ahora solo se pasa en el método call().
  Future<List<Comment>> call(int postId) async {
    try {
      return await commentRepositoryInterface.getComments(postId);
    } catch (e) {
      rethrow; 
    }
  }
}
