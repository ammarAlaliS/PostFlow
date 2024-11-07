import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post_flow/controllers/theme/theme_controller.dart';
import 'package:post_flow/core/configs/theme/app_colors.dart';
import 'package:post_flow/presentation/common/logo.dart';

class AppBarComponent extends StatelessWidget implements PreferredSizeWidget {
  const AppBarComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();

    return Obx(() => AppBar(
          toolbarHeight: 80,
          backgroundColor: themeController.isDarkMode.value
              ? ThemeColors.darkBackgroundColor
              : ThemeColors.lightBackgroundColor,
          title: const Align(
            alignment: Alignment.centerLeft,
            child: Logo(
              width: 50,
              height: 50,
            ),
          ),
          actions: [
            // Botón para cambiar tema
            IconButton(
              icon: Icon(
                themeController.isDarkMode.value
                    ? Icons.wb_sunny
                    : Icons.nights_stay,
                color: themeController.isDarkMode.value
                    ? ThemeColors.iconLight
                    : ThemeColors.iconDark,
              ),
              onPressed: () {
                if (themeController.isDarkMode.value) {
                  themeController.setLightMode();
                } else {
                  themeController.setDarkMode();
                }
              },
            ),
            IconButton(
              icon: Icon(
                Icons.settings,
                color: themeController.isDarkMode.value
                    ? ThemeColors.iconLight
                    : ThemeColors.iconDark,
              ),
              onPressed: () {},
            ),
            const SizedBox(width: 10), // Espaciado entre los íconos
          ],
        ));
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(80); // Aumenta la altura del AppBar
}
