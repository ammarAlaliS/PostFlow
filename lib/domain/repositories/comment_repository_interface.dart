
import 'package:post_flow/domain/entities/comment.dart';
abstract class CommentRepositoryInterface {
  Future<List<Comment>> getComments(int postId);
}
