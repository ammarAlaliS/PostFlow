import 'package:post_flow/data/data_sources/post_data_source.dart';
import 'package:post_flow/domain/entities/post.dart';
import 'package:post_flow/domain/repositories/post_repository_interface.dart';


class PostRepositoryImpl implements PostRepository {
  final PostRemoteDataSource remoteDataSource;

  PostRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Post>> getPosts(int page, int limit) async {
    return await remoteDataSource.getPosts(page, limit);
  }
}
