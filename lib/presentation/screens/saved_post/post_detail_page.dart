// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post_flow/controllers/save_post_controller.dart';
import 'package:post_flow/core/configs/theme/app_colors.dart';
import 'package:post_flow/domain/entities/post.dart'; // Importar el controlador

class PostSaved extends StatelessWidget {
  const PostSaved({super.key});

  @override
  Widget build(BuildContext context) {
    // Usamos el controlador para obtener las publicaciones guardadas
    final SavedPostsController savedPostsController = Get.find();

    return Obx(() {
      // Verificamos si hay publicaciones guardadas
      if (savedPostsController.savedPosts.isEmpty) {
        return const Center(
          child: Text(
            'No hay publicaciones guardadas',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        );
      }

      return ListView.builder(
        itemCount: savedPostsController.savedPosts.length,
        itemBuilder: (context, index) {
          final post = savedPostsController.savedPosts[index];
          return PostItem(
            post: post, // Pasar el objeto completo `Post`
            isDarkMode: false, // O usa tu variable de tema si es necesario
          );
        },
      );
    });
  }
}

class PostItem extends StatelessWidget {
  final Post post; 
  final bool isDarkMode;

  const PostItem({
    Key? key,
    required this.post,
    required this.isDarkMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SavedPostsController savedPostsController = Get.find();
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
            post.title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(post.body, style: TextStyle(fontSize: 14, color: Colors.grey[700])),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(post.date, style: TextStyle(fontSize: 12, color: Colors.grey[500])),
                  Spacer(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 255, 198, 198),
                    ),
                    onPressed: () {
                      
                      savedPostsController.removeSavedPost(post); 
                    }, 
                    child: Text(
                      "Eliminar", 
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: ThemeColors.accentColor,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
          onTap: () {
            
          },
        ),
      ),
    );
  }
}
