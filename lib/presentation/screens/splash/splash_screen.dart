import 'package:flutter/material.dart';
import 'package:post_flow/core/configs/assets/app_images.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Center(
        child: Image.asset(
          AppImages.postFlowLogo,
          width: 150,
          height: 150,
          fit: BoxFit.cover
          ),
      ),
    );
  }
}