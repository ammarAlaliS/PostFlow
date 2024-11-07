import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post_flow/controllers/get_user_controller.dart';
import 'package:post_flow/controllers/theme/theme_controller.dart';
import 'package:post_flow/core/configs/theme/app_colors.dart';

class PostCard extends StatelessWidget {
  final String title;
  final String body;
  final String date;
  final int userId;

  const PostCard({
    super.key,
    required this.title,
    required this.body,
    required this.date,
    required this.userId,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    final isDarkMode = themeController.isDarkMode.value;

    final screenWidth = MediaQuery.of(context).size.width;

    double titleFontSize = screenWidth > 600 ? 22 : 18;
    double bodyFontSize = screenWidth > 600 ? 18 : 16;
    double dateFontSize = screenWidth > 600 ? 16 : 14;

    final UserController userController = Get.find();
    userController.fetchUser(userId);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: titleFontSize,
              fontWeight: FontWeight.bold,
              color: isDarkMode ? ThemeColors.darkPrimaryTextColor : ThemeColors.primaryTextColor,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            body,
            style: TextStyle(
              fontSize: bodyFontSize,
              color: isDarkMode ? ThemeColors.darkSecondaryTextColor : ThemeColors.secondaryTextColor,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text(
                date,
                style: TextStyle(
                  fontSize: dateFontSize,
                  color: isDarkMode ? Colors.grey[400] : Colors.grey[700],
                ),
              ),
              const Spacer(),
              Obx(() {
                if (userController.isLoading.value) {
                  return Text(
                    'Cargando usuario...',
                    style: TextStyle(
                      fontSize: dateFontSize,
                      color: isDarkMode ? Colors.grey[400] : Colors.grey[700],
                    ),
                  );
                }
                final user = userController.user.value;
                if (user == null) {
                  return Text(
                    'Usuario no disponible',
                    style: TextStyle(
                      fontSize: dateFontSize,
                      color: isDarkMode ? Colors.grey[400] : Colors.grey[700],
                    ),
                  );
                }
                return Text(
                  user.name,
                  style: TextStyle(
                    fontSize: dateFontSize,
                    color: isDarkMode ? Colors.grey[400] : Colors.grey[700],
                  ),
                );
              }),
            ],
          ),
        ],
      ),
    );
  }
}
