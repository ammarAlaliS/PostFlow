// ignore_for_file: prefer_const_constructors

import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Welcome to the Flutter App!',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}