// ignore_for_file: prefer_const_constructors

import 'package:flutter/widgets.dart';

class PostSaved extends StatelessWidget {
  const PostSaved({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Welcome to the Flutter App postsaved!',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}