import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post_flow/controllers/post_controller.dart';
import 'package:post_flow/controllers/theme/theme_controller.dart';
import 'package:post_flow/core/configs/theme/app_colors.dart';
import 'package:post_flow/presentation/screens/post_details/post_details_screen.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final PostController postController = Get.put(PostController(getPostsUseCase: Get.find()));
    final ThemeController themeController = Get.find();
    final isDarkMode = themeController.isDarkMode.value;

    return Obx(() {
      if (postController.isLoading.value && postController.posts.isEmpty) {
        return _buildSkeleton(isDarkMode);
      }

      if (postController.posts.isEmpty && !postController.isLoading.value) {
        return const Center(
            child: Text('No hay publicaciones',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)));
      }

      return ListView.builder(
        controller: _initializeScrollController(postController),
        itemCount: postController.posts.length + 1,
        itemBuilder: (context, index) {
          if (index == postController.posts.length) {
            return _buildLoadingIndicator(isDarkMode, postController.isLoading.value);
          }

          final post = postController.posts[index];
          return PostItem(
            id: post.id,
            userId: post.userId,
            title: post.title,
            body: post.body,
            date: post.date,
            isDarkMode: isDarkMode,
          );
        },
      );
    });
  }

  // Widget para el Skeleton usando Skeletonizer
  Widget _buildSkeleton(bool isDarkMode) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Skeletonizer(
            enabled: true,
            child: Container(
              height: 100,
              color: isDarkMode ? Colors.grey.shade800 : Colors.grey.shade300,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSkeletonContainer(isDarkMode, 16),
                  const SizedBox(height: 8),
                  _buildSkeletonContainer(isDarkMode, 14),
                  const SizedBox(height: 8),
                  _buildSkeletonContainer(isDarkMode, 12),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // Widget para un contenedor de esqueleto
  Widget _buildSkeletonContainer(bool isDarkMode, double height) {
    return Container(
      height: height,
      color: isDarkMode ? Colors.grey.shade600 : Colors.grey.shade200,
    );
  }

  // Indicador de carga al final de la lista
  Widget _buildLoadingIndicator(bool isDarkMode, bool isLoading) {
    return isLoading
        ? Center(
            child: SizedBox(
              width: 30,
              height: 30,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: isDarkMode
                    ? ThemeColors.lightBackgroundColor
                    : ThemeColors.darkBackgroundColor,
              ),
            ),
          )
        : const SizedBox.shrink();
  }

  // Inicializar el controlador de scroll
  ScrollController _initializeScrollController(PostController postController) {
    final ScrollController scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent &&
          !postController.isLoading.value && postController.hasMorePosts.value) {
        postController.fetchPosts();
      }
    });
    return scrollController;
  }
}

// Widget individual de PostItem
class PostItem extends StatelessWidget {
  final int id;
  final int userId;
  final String title;
  final String body;
  final String date;
  final bool isDarkMode;

  const PostItem({
    Key? key,
    required this.id,
    required this.title,
    required this.body,
    required this.date,
    required this.isDarkMode, required this.userId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.all(16.0),
          title: Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(body, style: TextStyle(fontSize: 14, color: Colors.grey[700])),
              const SizedBox(height: 8),
              Text(date, style: TextStyle(fontSize: 12, color: Colors.grey[500])),
            ],
          ),
          onTap: () {
            Get.to(
              () => PostDetailScreen(id: id, userId: userId, title: title, body: body, date: date, isDarkMode: isDarkMode,),
              transition: Transition.rightToLeft,
              duration: const Duration(milliseconds: 300),
            );
          },
        ),
      ),
    );
  }
}
