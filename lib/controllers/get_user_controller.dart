import 'package:get/get.dart';
import 'package:post_flow/domain/usecases/get_user.dart';
import 'package:post_flow/domain/entities/user.dart';

class UserController extends GetxController {
  final GetUserUseCase getUserUseCase;

  var user = Rx<User?>(null);
  
  var isLoading = false.obs;

  UserController({required this.getUserUseCase});

  Future<void> fetchUser(int userId) async {
    isLoading.value = true;

    try {
      final fetchedUser = await getUserUseCase.call(userId);
      user.value = fetchedUser;  
    } catch (e) {
      Get.snackbar('Error', 'Failed to load user: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
