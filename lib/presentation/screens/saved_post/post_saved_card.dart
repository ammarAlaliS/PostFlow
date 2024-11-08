import 'package:flutter/material.dart';
import 'package:post_flow/core/configs/theme/app_colors.dart';
import 'package:post_flow/controllers/theme/theme_controller.dart';
import 'package:get/get.dart';

// Componente que representa una publicación en un Card
class PostItemCard extends StatelessWidget {
  final int id;
  final int userId;
  final String title;
  final String body;
  final String date;
  final bool isDarkMode;
  final VoidCallback onSavePressed;

  const PostItemCard({
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
                      backgroundColor: themeController.isDarkMode.value
                          ? ThemeColors.lightBackgroundColor
                          : ThemeColors.darkBackgroundColor,
                    ),
                    onPressed: onSavePressed,
                    child: Text(
                      "Eliminar",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: themeController.isDarkMode.value
                            ? ThemeColors.iconLight
                            : ThemeColors.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          onTap: () {
            // Acción al presionar el Card, si es necesario
            // Get.to(PostDetailScreen(...));
          },
        ),
      ),
    );
  }
}
