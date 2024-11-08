// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post_flow/controllers/post_controller.dart';
import 'package:post_flow/controllers/save_post_controller.dart';
import 'package:post_flow/controllers/theme/theme_controller.dart';
import 'package:post_flow/core/configs/theme/app_colors.dart';
import 'package:post_flow/presentation/screens/post_details/post_details_screen.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final PostController postController =
        Get.put(PostController(getPostsUseCase: Get.find()));
    final ThemeController themeController = Get.find();
    final SavedPostsController savedPostsController = Get.find();
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
            return _buildLoadingIndicator(
                isDarkMode, postController.isLoading.value);
          }

          final post = postController.posts[index];
          return PostItem(
            id: post.id,
            userId: post.userId,
            title: post.title,
            body: post.body,
            date: post.date,
            isDarkMode: isDarkMode,
            onSavePressed: () {
              savedPostsController.savePost(post);
             
              Get.snackbar(
                'Post Guardado',
                'El post ha sido guardado con éxito',
                snackPosition: SnackPosition.BOTTOM, 
                backgroundColor: Colors.green,
                colorText: Colors.white, 
                duration: const Duration(seconds: 1),
              );
            },
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
              height: 120, 
              color: isDarkMode ? Colors.grey.shade800 : Colors.grey.shade300,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
            
                  _buildSkeletonContainer(isDarkMode, 20, 120),
                  const SizedBox(height: 8),
            
                  _buildSkeletonContainer(isDarkMode, 14, 100),
                  const SizedBox(height: 8),
              
                  _buildSkeletonContainer(isDarkMode, 12, 80),
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
      color: isDarkMode ? Colors.grey.shade600 : Colors.grey.shade200,
    );
  }

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

  ScrollController _initializeScrollController(PostController postController) {
    final ScrollController scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent &&
          !postController.isLoading.value &&
          postController.hasMorePosts.value) {
        postController.fetchPosts();
      }
    });
    return scrollController;
  }
}


class PostItem extends StatelessWidget {
  final int id;
  final int userId;
  final String title;
  final String body;
  final String date;
  final bool isDarkMode;
  final VoidCallback onSavePressed; 

  const PostItem({
    Key? key,
    required this.id,
    required this.title,
    required this.body,
    required this.date,
    required this.isDarkMode,
    required this.userId,
    required this.onSavePressed, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
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
              Row(
                children: [
                  Text(date, style: TextStyle(fontSize: 12, color: Colors.grey[500])),
                  Spacer(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 90, 89, 89),
                    ),
                    onPressed: onSavePressed, 
                    child: Text(
                      "Guardar",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: ThemeColors.primaryColor,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
          onTap: () {
            Get.to(
              () => PostDetailScreen(
                id: id,
                userId: userId,
                title: title,
                body: body,
                date: date,
                isDarkMode: isDarkMode,
              ),
              transition: Transition.rightToLeft,
              duration: const Duration(milliseconds: 300),
            );
          },
        ),
      ),
    );
  }
}
