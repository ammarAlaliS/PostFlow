// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:post_flow/presentation/screens/get_started/get_started_screen.dart';
import 'package:get/get.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FlowPost',
      home: GetStartedScreen(),
    ); 
  }
}
