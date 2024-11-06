// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:post_flow/core/configs/assets/app_images.dart';
import 'package:post_flow/presentation/common/basic_app_button.dart';


class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Color(0xFF0C0C0C),  
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            bool isTablet = constraints.maxWidth > 600;
            
            double logoSize = isTablet ? 200 : 150;
            double paddingValue = isTablet ? 20.0 : 30.0;
            double buttonHeight = isTablet ? 60.0 : 40.0;

            return Padding(
              padding: EdgeInsets.all(paddingValue),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppImages.postFlowLogo,
                    height: logoSize,
                    width: logoSize,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: isTablet ? 60 : 40), 
                  CustomAnimatedButton(
                    onPressed: () {},
                    title: "CONTINUAR COMO INVITADO",
                    height: buttonHeight,  
                    backgroundColor: Color(0xFF9AD665),
                    textColor: Color(0xFF0C0C0C),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
