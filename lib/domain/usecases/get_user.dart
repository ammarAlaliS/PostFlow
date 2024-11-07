import 'package:post_flow/domain/repositories/user_repository.dart';
import 'package:post_flow/domain/entities/user.dart';

class GetUserUseCase {
  final UserRepositoryInterface userRepositoryInterface;

  GetUserUseCase({required this.userRepositoryInterface});

  Future<User> call(int userId) async {
    try {
      return await userRepositoryInterface.getUser(userId);
    } catch (e) {
      rethrow;
    }
  }
}
