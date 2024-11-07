// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post_flow/controllers/root/index_controller.dart';
import 'package:post_flow/controllers/theme/theme_controller.dart';
import 'package:post_flow/core/configs/theme/app_colors.dart';
import 'package:post_flow/core/utils/update_system_ui_overlay.dart';
import 'package:post_flow/presentation/common/custom_scaffold.dart';
import 'package:post_flow/presentation/root/BottomNavigatorBarPage.dart';
import 'package:post_flow/presentation/root/appbar/app_bar.dart';
import 'package:post_flow/presentation/screens/home/home_page.dart';
import 'package:post_flow/presentation/screens/profile/profile_screen.dart';
import 'package:post_flow/presentation/screens/saved_post/post_detail_page.dart';

class Root extends StatelessWidget {
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    final IndexController indexController = Get.put(IndexController());

    final List<Widget> pages = [
      HomePage(),
      PostSaved(),
      ProfileScreen(),
    ];

    return SafeArea(
      child: Obx(() {
        final isDarkMode = themeController.isDarkMode.value;

        final selectedItemColor = isDarkMode
            ? Color.fromARGB(255, 219, 255, 238)
            : const Color.fromARGB(255, 6, 6, 6);
        final unselectedItemColor = isDarkMode
            ? const Color.fromARGB(255, 255, 255, 255)
            : const Color.fromARGB(137, 20, 20, 20);
        final backgroundColor = isDarkMode
            ? ThemeColors.darkBackgroundColor
            : ThemeColors.lightBackgroundColor;

        updateSystemUIOverlay(isDarkMode: isDarkMode);

        return CustomScaffold(
          appBar: const AppBarComponent(),
          body: PageView(
            controller: indexController.pageController,
            onPageChanged: (index) {
              indexController.currentIndex.value = index;
            },
            children: pages,
          ),
          bottomNavigationBar: BottomNavigatorBarPage(
            currentIndex: indexController.currentIndex.value,
            pageController: indexController.pageController,
            onTap: (index) {
              indexController.changePage(index);
            },
            selectedItemColor: selectedItemColor,
            unselectedItemColor: unselectedItemColor,
            backgroundColor: backgroundColor,
          ),
        );
      }),
    );
  }
}
