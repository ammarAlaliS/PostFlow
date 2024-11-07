import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:post_flow/controllers/theme/theme_controller.dart';
import 'package:post_flow/core/configs/assets/app_vectors.dart';
import 'package:post_flow/core/configs/theme/app_colors.dart';
import 'package:post_flow/core/utils/update_system_ui_overlay.dart';
import 'package:post_flow/presentation/common/basic_app_button.dart';
import 'package:post_flow/presentation/common/logo.dart';
import 'package:post_flow/presentation/root/root.dart';
import 'package:post_flow/presentation/widgets/basic_app_select_theme_button.dart';

class ScaffoldBody extends StatelessWidget {
  const ScaffoldBody({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();

    return Center(
      child: LayoutBuilder(
        builder: (context, constraints) {
          bool isTablet = constraints.maxWidth > 600;
          double paddingValue = isTablet ? 20.0 : 30.0;
          double buttonHeight = isTablet ? 60.0 : 45.0;

          return Padding(
            padding: EdgeInsets.all(paddingValue),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Logo(
                  height: 0,
                  width: 0,
                ),
                SizedBox(height: isTablet ? 60 : 40),
                _buildRow(context, themeController),
                SizedBox(height: isTablet ? 60 : 40),
                Obx(() => CustomAnimatedButton(
                      onPressed: () async {
                        // Verifica si el controlador está listo antes de navegar
                      if (Get.isRegistered<ThemeController>()) {
                        // Realiza la navegación
                        await Get.off(() => const Root(),
                            transition: Transition.rightToLeft,
                            duration: const Duration(milliseconds: 300));
                      }
                      },
                      title: "CONTINUAR COMO INVITADO",
                      height: buttonHeight,
                      backgroundColor: themeController.isDarkMode.value
                          ? ThemeColors.darkPrimaryColor
                          : ThemeColors.darkBackgroundColor,
                      textColor: themeController.isDarkMode.value
                          ? ThemeColors.darkBackgroundColor
                          : ThemeColors.iconLight,
                    ))
              ],
            ),
          );
        },
      ),
    );
  }
}

Widget _buildRow(BuildContext context, ThemeController themeController) {
  themeController.isDarkMode.listen((isDarkMode) {
    updateSystemUIOverlay(isDarkMode: isDarkMode);
  });
  updateSystemUIOverlay(isDarkMode: themeController.isDarkMode.value);
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Obx(
        () => BasicAppSelectTheme(
          initialCircleColor: themeController.isDarkMode.value
              ? ThemeColors.darkPrimaryColor
              : Colors.black.withOpacity(0.5),
          initialIcon: SvgPicture.asset(
            AppVectors.moon,
            color: themeController.isDarkMode.value
                ? ThemeColors.iconLight
                : ThemeColors.iconLight,
          ),
          labelText: 'Oscuro',
          initialBorderColor: themeController.isDarkMode.value
              ? ThemeColors.secondaryTextColor
              : ThemeColors.iconDark,
          textColor: Colors.grey,
          onTap: () {
            themeController.setDarkMode();
          },
        ),
      ),
      const SizedBox(width: 40),
      Obx(
        () => BasicAppSelectTheme(
          initialCircleColor: themeController.isDarkMode.value
              ? const Color.fromARGB(255, 42, 42, 42)
              : ThemeColors.darkPrimaryColor.withOpacity(0.5),
          initialIcon: SvgPicture.asset(
            AppVectors.sun,
            color: themeController.isDarkMode.value
                ? ThemeColors.iconLight
                : ThemeColors.iconDark,
          ),
          labelText: 'Claro',
          initialBorderColor: themeController.isDarkMode.value
              ? ThemeColors.secondaryTextColor
              : ThemeColors.iconDark,
          textColor: Colors.grey,
          onTap: () {
            themeController.setLightMode();
          },
        ),
      )
    ],
  );
}
