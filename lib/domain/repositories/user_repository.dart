import 'package:post_flow/domain/entities/user.dart';

abstract class UserRepositoryInterface {
  Future<User> getUser(int userId);
}
