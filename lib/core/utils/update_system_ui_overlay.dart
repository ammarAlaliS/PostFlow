// utils/system_ui_overlay_helper.dart
import 'package:flutter/services.dart';
import 'package:post_flow/core/configs/theme/app_colors.dart';

void updateSystemUIOverlay({required bool isDarkMode}) {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: isDarkMode ? ThemeColors.darkBackgroundColor : ThemeColors.lightBackgroundColor,
    systemNavigationBarColor: isDarkMode ? ThemeColors.darkBackgroundColor : ThemeColors.lightBackgroundColor,
    statusBarIconBrightness: isDarkMode ? Brightness.light : Brightness.dark,
    systemNavigationBarIconBrightness: isDarkMode ? Brightness.light : Brightness.dark,
  ));
}
