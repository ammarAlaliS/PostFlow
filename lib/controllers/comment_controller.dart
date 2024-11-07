import 'package:get/get.dart';
import 'package:post_flow/domain/entities/comment.dart';
import 'package:post_flow/domain/usecases/get_post_commet.dart';  // Asegúrate de importar el UseCase

class CommentController extends GetxController {
  // Lista observable para almacenar los comentarios
  var comments = <Comment>[].obs;
  
  // Estado observable para saber si los comentarios se están cargando
  var isLoading = false.obs;

  // El caso de uso que obtendrá los comentarios
  final GetPostCommentUseCase getPostCommentUseCase;

  // Constructor que inyecta el caso de uso
  CommentController({required this.getPostCommentUseCase});

  // Función para obtener los comentarios
  Future<void> fetchComments(int postId) async {
    isLoading.value = true;

    try {
      // Usamos el caso de uso para obtener los comentarios
      final newComments = await getPostCommentUseCase(postId);
      if (newComments.isNotEmpty) {
        comments.assignAll(newComments); // Reemplaza los comentarios actuales con los nuevos
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to load comments: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
