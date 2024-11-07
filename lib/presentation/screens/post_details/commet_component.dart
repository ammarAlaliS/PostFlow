import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post_flow/controllers/comment_controller.dart';
import 'package:post_flow/domain/entities/comment.dart';
import 'package:post_flow/controllers/theme/theme_controller.dart';
import 'package:post_flow/core/configs/theme/app_colors.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CommentsSection extends StatelessWidget {
  final int postId;  

  const CommentsSection({
    super.key,
    required this.postId,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    final isDarkMode = themeController.isDarkMode.value;

    // Obtenemos el controlador de comentarios
    final CommentController controller = Get.put(CommentController(
      getPostCommentUseCase: Get.find(),  
    ));

    // Llamamos a fetchComments cuando el widget se construye
    controller.fetchComments(postId);

    final screenWidth = MediaQuery.of(context).size.width;
    double nameFontSize = screenWidth > 600 ? 18 : 16;
    double bodyFontSize = screenWidth > 600 ? 16 : 14;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Usamos Obx para escuchar cambios en el estado del controlador
        Obx(() {
          if (controller.isLoading.value) {
            return _buildSkeleton(isDarkMode); // Mostramos el skeleton mientras cargan los comentarios
          }

          if (controller.comments.isEmpty) {
            return const Center(child: Text('No hay comentarios para esta publicación.'));
          }

          return _buildCommentsList(controller.comments, nameFontSize, bodyFontSize, isDarkMode);
        }),
      ],
    );
  }

  Widget _buildCommentsList(
    List<Comment> comments,
    double nameFontSize,
    double bodyFontSize,
    bool isDarkMode,
  ) {
    return ListView.builder(
      itemCount: comments.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final comment = comments[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 10.0),
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundImage: NetworkImage(
                        'https://www.gravatar.com/avatar/${comment.email.hashCode}?d=identicon'),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          comment.email,
                          style: TextStyle(
                            fontSize: nameFontSize,
                            fontWeight: FontWeight.bold,
                            color: isDarkMode ? ThemeColors.darkPrimaryTextColor : ThemeColors.primaryTextColor,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          comment.body,
                          style: TextStyle(
                            fontSize: bodyFontSize,
                            color: isDarkMode ? ThemeColors.darkSecondaryTextColor : ThemeColors.secondaryTextColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildSkeleton(bool isDarkMode) {
    return ListView.builder(
      itemCount: 5,  // Solo mostramos 5 skeletons para simular carga
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Skeletonizer(
            enabled: true,
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: isDarkMode ? Colors.grey.shade800 : const Color.fromARGB(255, 255, 248, 248),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: isDarkMode ? Colors.grey.shade700 : Colors.grey.shade400,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildSkeletonContainer(isDarkMode, 16, 100),
                        const SizedBox(height: 8),
                        _buildSkeletonContainer(isDarkMode, 12, double.infinity),
                        const SizedBox(height: 4),
                        _buildSkeletonContainer(isDarkMode, 12, 150),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildSkeletonContainer(bool isDarkMode, double height, double width) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.grey.shade700 : Colors.grey.shade400,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
