import 'package:post_flow/domain/entities/user.dart';
import 'package:post_flow/domain/repositories/user_repository.dart';

class GetUser {
  final UserRepository repository;

  GetUser({required this.repository});

  Future<User> call() {
    return repository.getUser();
  }
}
