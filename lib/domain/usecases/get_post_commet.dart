import 'package:post_flow/domain/repositories/comment_repository_interface.dart';
import 'package:post_flow/domain/entities/comment.dart';

class GetPostCommentUseCase {
  final CommentRepositoryInterface commentRepositoryInterface;

  GetPostCommentUseCase({
    required this.commentRepositoryInterface,
  });

  Future<List<Comment>> call(int postId) async {
    try {
      return await commentRepositoryInterface.getComments(postId);
    } catch (e) {
      rethrow; 
    }
  }
}
