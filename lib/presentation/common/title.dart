import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post_flow/controllers/theme/theme_controller.dart';
import 'package:post_flow/core/configs/theme/app_colors.dart';

class CustomTitle extends StatelessWidget {
  final String title;
  const CustomTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    final isDarkMode = themeController.isDarkMode.value;
    final screenWidth = MediaQuery.of(context).size.width;

    double fontSize = screenWidth > 600 ? 26 : 22;

    return Text(
      title,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: isDarkMode ? ThemeColors.darkPrimaryTextColor : ThemeColors.primaryTextColor,
      ),
    );
  }
}

