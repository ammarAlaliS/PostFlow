import 'package:post_flow/domain/entities/post.dart';
import 'package:post_flow/domain/repositories/post_repository_interface.dart';

class GetPosts {
  final PostRepository repository;

  GetPosts({required this.repository});

  Future<List<Post>> call(int page, int limit) {
    return repository.getPosts(page, limit);
  }
}
