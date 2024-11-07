// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:post_flow/core/configs/theme/app_colors.dart';

class AppThemes {
  // Tema claro
  static ThemeData lightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: ThemeColors.primaryColor,
      colorScheme: ColorScheme.light(
        secondary: ThemeColors.accentColor, // Color de acento
      ),
      scaffoldBackgroundColor: ThemeColors.lightBackgroundColor, // Fondo del Scaffold
      textTheme: TextTheme(
        bodyLarge: TextStyle(color: ThemeColors.primaryTextColor), // Para texto principal
        bodyMedium: TextStyle(color: ThemeColors.secondaryTextColor), // Para texto secundario
        // Define el color del texto de los enlaces
        bodySmall: TextStyle(color: ThemeColors.linkColor), // Color para los enlaces
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: ThemeColors.secondaryColor,
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: ThemeColors.borderColor),
        ),
      ),
      iconTheme: IconThemeData(color: ThemeColors.primaryTextColor),
      dividerColor: ThemeColors.borderColor,
    );
  }

  // Tema oscuro
  static ThemeData darkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: ThemeColors.darkPrimaryColor,
      colorScheme: ColorScheme.dark(
        secondary: ThemeColors.darkAccentColor, 
      ),
      scaffoldBackgroundColor: ThemeColors.darkBackgroundColor, 
      textTheme: TextTheme(
        bodyLarge: TextStyle(color: ThemeColors.darkPrimaryTextColor), 
        bodyMedium: TextStyle(color: ThemeColors.darkSecondaryTextColor), 
        bodySmall: TextStyle(color: ThemeColors.darkLinkColor), 
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: ThemeColors.darkSecondaryColor,
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: ThemeColors.darkBorderColor),
        ),
      ),
      iconTheme: IconThemeData(color: ThemeColors.darkPrimaryTextColor),
      dividerColor: ThemeColors.darkBorderColor,
    );
  }
}
