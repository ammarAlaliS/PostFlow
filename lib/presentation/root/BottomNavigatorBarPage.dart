import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:post_flow/controllers/theme/theme_controller.dart';
import 'package:post_flow/core/configs/assets/app_vectors.dart';
import 'package:post_flow/core/configs/theme/app_colors.dart';

class BottomNavigatorBarPage extends StatelessWidget {
  final int currentIndex;
  final PageController pageController;
  final Function(int) onTap;

  const BottomNavigatorBarPage({
    Key? key,
    required this.currentIndex,
    required this.pageController,
    required this.onTap,
    required Color selectedItemColor,
    required Color unselectedItemColor,
    required Color backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();

    return Material(
      elevation: 0,
      child: Obx(() {
        final bool isDarkMode = themeController.isDarkMode.value;

        final selectedItemColor = isDarkMode
            ? Color.fromARGB(255, 219, 255, 238)
            : const Color.fromARGB(255, 6, 6, 6);
        final unselectedItemColor = isDarkMode
            ? const Color.fromARGB(255, 255, 255, 255)
            : const Color.fromARGB(137, 20, 20, 20);
        final backgroundColor = isDarkMode
            ? ThemeColors.darkBackgroundColor
            : ThemeColors.lightBackgroundColor;

        return BottomNavigationBar(
          currentIndex: currentIndex,
          selectedItemColor: selectedItemColor,
          unselectedItemColor: unselectedItemColor,
          onTap: (index) {
            onTap(index); 
            pageController.jumpToPage(index); 
          },
          items: _buildBottomNavigationBarItems(),
          selectedLabelStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w900,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w600,
          ),
          backgroundColor: backgroundColor,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
        );
      }),
    );
  }

 List<BottomNavigationBarItem> _buildBottomNavigationBarItems() {
    const items = [
      {'icon': AppVectors.home, 'label': 'Inicio'},
      {'icon': AppVectors.article, 'label': 'Post guardados'},
      {'icon': AppVectors.user, 'label': 'Perfil'},
    ];

    return List.generate(items.length, (index) {
      final item = items[index];
      final isSelected = currentIndex == index;
      final iconColor = isSelected
          ? ThemeColors.primaryColor
          : const Color.fromARGB(255, 81, 81, 81);

      return BottomNavigationBarItem(
        icon: SvgPicture.asset(
          item['icon']!,
          color: iconColor,
        ),
        label: item['label'],
        tooltip: item['label'],
      );
    });
  }
}

