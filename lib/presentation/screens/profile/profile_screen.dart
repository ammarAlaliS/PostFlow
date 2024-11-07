// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post_flow/controllers/get_user_controller.dart';
import 'package:post_flow/core/configs/theme/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.find();
    userController.fetchUser(1);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center, 
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                'https://www.w3schools.com/howto/img_avatar.png',
              ),
            ),
            const SizedBox(height: 20),
            
            Obx(() {
              if (userController.isLoading.value) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              final user = userController.user.value;
              if (user == null) {
                return Center(
                  child: Text("Usuario no disponible"),
                );
              }

              return Column(
                children: [
                  Text(
                    user.name,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    user.email,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                     
                      Get.offAllNamed('/');
                    },
                    child: Text(
                      "Cerrar sesión",
                       style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: ThemeColors.primaryColor,
                        letterSpacing: 1.0,
                      ),
                      ),
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
