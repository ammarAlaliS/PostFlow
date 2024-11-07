import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post_flow/controllers/theme/theme_controller.dart';
import 'package:post_flow/core/configs/assets/app_images.dart';

class Logo extends StatelessWidget {
  final double height;
  final double width;

  const Logo({Key? key, required this.height, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();

    return LayoutBuilder(
      builder: (context, constraints) {
        bool isTablet = constraints.maxWidth > 600;
        double logoSize = isTablet ? 400 : 150;

        return Obx(() => Image.asset(
              themeController.isDarkMode.value
                  ? AppImages.postFlowLogo 
                  : AppImages.postFlowLogoLight, 
              height: height > 0 ? height : logoSize,
              width: width > 0 ? width : logoSize,
              fit: BoxFit.contain,
            ));
      },
    );
  }
}
