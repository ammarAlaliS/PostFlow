import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post_flow/controllers/theme/theme_controller.dart';
import 'package:post_flow/core/configs/theme/app_colors.dart';

class PostCard extends StatelessWidget {
  final String title;
  final String body;
  final String date;

  const PostCard({
    super.key,
    required this.title,
    required this.body,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    final isDarkMode = themeController.isDarkMode.value;
    final screenWidth = MediaQuery.of(context).size.width;

    // Ajusta el tamaño de la fuente según el ancho de la pantalla
    double titleFontSize = screenWidth > 600 ? 22 : 18;
    double bodyFontSize = screenWidth > 600 ? 18 : 16;
    double dateFontSize = screenWidth > 600 ? 16 : 14;

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
          Text(
            date,
            style: TextStyle(
              fontSize: dateFontSize,
              color: isDarkMode ? Colors.grey[400] : Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }
}
