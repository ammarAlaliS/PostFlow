import 'package:get/get.dart';
import 'package:post_flow/domain/entities/post.dart';
import 'package:post_flow/domain/usecases/get_posts.dart';

class PostController extends GetxController {
  final GetPosts getPostsUseCase;

  var posts = <Post>[].obs;
  var isLoading = false.obs;
  var currentPage = 1;
  var hasMorePosts = true.obs;

  PostController({required this.getPostsUseCase});

  @override
  void onInit() {
    super.onInit();
    fetchPosts();
  }

  Future<void> fetchPosts() async {
    if (isLoading.value || !hasMorePosts.value) return;
    isLoading.value = true;
    
    try {
      final newPosts = await getPostsUseCase(currentPage, 10);
      if (newPosts.isNotEmpty) {
        posts.addAll(newPosts);
        currentPage++;
      } else {
        hasMorePosts.value = false; 
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to load posts: $e'); 
    } finally {
      isLoading.value = false;
    }
  }

  void clearPosts() {
    posts.clear();
    currentPage = 1;
    hasMorePosts.value = true;
  }

  Future<void> retryFetch() async {
    if (!isLoading.value && !hasMorePosts.value) {
      hasMorePosts.value = true;
      await fetchPosts();
    }
  }
}
