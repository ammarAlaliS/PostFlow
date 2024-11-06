import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post_flow/controllers/animation/button_animation_controller.dart';

class CustomAnimatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final double height;
  final Color? backgroundColor;
  final Color textColor;
  final Color? borderColor;

  const CustomAnimatedButton({
    super.key,
    required this.onPressed,
    required this.title,
    required this.height,
    this.backgroundColor,
    this.textColor = Colors.white,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    final ButtonAnimationController controller = Get.put(ButtonAnimationController());
    controller.currentColor.value = backgroundColor ?? Theme.of(context).primaryColor;

    double buttonWidth = MediaQuery.of(context).size.width * 0.8;
    double fontSize = MediaQuery.of(context).size.width * 0.045;

    if (MediaQuery.of(context).size.width > 400) {
      buttonWidth = 600; 
    }

    if (MediaQuery.of(context).size.width > 400) {
      fontSize = MediaQuery.of(context).size.width * 0.035; 
    }

    fontSize = fontSize < 16 ? 16 : fontSize;

    return GestureDetector(
      onTapDown: (_) {
        controller.currentColor.value = (backgroundColor?.withOpacity(0.7)) ?? Theme.of(context).primaryColor.withOpacity(0.8);
        controller.scale.value = 0.95;
      },
      onTapUp: (_) {
        controller.currentColor.value = backgroundColor ?? Theme.of(context).primaryColor;
        controller.scale.value = 1.0;
      },
      onTap: onPressed,
      child: Obx(
        () => AnimatedContainer(
          duration: Duration(milliseconds: 200),
          curve: Curves.easeOut,
          width: buttonWidth,
          height: height,
          decoration: BoxDecoration(
            color: controller.currentColor.value, 
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
              ),
            ],
            border: Border.all(
              color: borderColor ?? Colors.transparent,
              width: 2,
            ),
          ),
          child: Transform.scale(
            scale: controller.scale.value,
            child: Center(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.w900,
                  color: textColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
