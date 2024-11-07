import 'package:post_flow/data/data_sources/user_data_sources.dart';
import 'package:post_flow/domain/entities/user.dart';
import 'package:post_flow/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl({required this.remoteDataSource});

  @override
  Future<User> getUser() async {
    return await remoteDataSource.getUser();
  }
}
