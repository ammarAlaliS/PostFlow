import 'package:post_flow/data/data_sources/user_data_sources.dart';
import 'package:post_flow/domain/entities/user.dart';
import 'package:post_flow/domain/repositories/user_repository.dart';


class UserRepositoryImpl implements UserRepositoryInterface {
  final UserRemoteDataSource userRemoteDataSource;

  UserRepositoryImpl({required this.userRemoteDataSource});

  @override
  Future<User> getUser(int userId) async {
    // Obtenemos el UserModel desde el data source
    final userModel = await userRemoteDataSource.getUser(userId);
    // Convertimos el UserModel en una entidad del dominio
    return userModel.toDomain();
  }
}