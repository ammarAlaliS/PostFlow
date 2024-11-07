import 'package:post_flow/domain/entities/post.dart';

abstract class PostRepository {
  Future<List<Post>> getPosts(int page, int limit);
}
