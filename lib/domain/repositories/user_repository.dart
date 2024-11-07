import 'package:post_flow/domain/entities/user.dart';

abstract class UserRepository {
  Future<User> getUser();
}
