// ignore_for_file: prefer_const_constructors

import 'package:flutter/widgets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Welcome to the Flutter App profile!',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}