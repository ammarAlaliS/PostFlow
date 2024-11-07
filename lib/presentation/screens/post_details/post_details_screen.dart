import 'package:flutter/material.dart';
import 'package:post_flow/presentation/common/custom_scaffold.dart';
import 'package:post_flow/presentation/screens/post_details/body.dart';

class PostDetailScreen extends StatelessWidget {
  final String title;
  final String body;
  final String date;
  final int id;
  final int userId;
  final bool isDarkMode;

  const PostDetailScreen({
    super.key,
    required this.title,
    required this.body,
    required this.date,
    required this.id,
    required this.isDarkMode, 
    required this.userId,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScaffold(
        body: BodyPostDetails(
          title: title,
          body: body,
          date: date,
          id: id,
          userId: userId,
          isDarkMode: isDarkMode,
        ),
      ),
    );
  }
}


