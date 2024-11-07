// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:post_flow/presentation/common/title.dart';
import 'package:post_flow/presentation/screens/post_details/commet_component.dart';
import 'package:post_flow/presentation/screens/post_details/post_card.dart';

class BodyPostDetails extends StatelessWidget {
  final String title;
  final String body;
  final String date;
  final int id;
  final bool isDarkMode;

  const BodyPostDetails({
    super.key,
    required this.title,
    required this.body,
    required this.date,
    required this.id,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {


    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            CustomTitle(title: "Detalles de la publicación"),
            const SizedBox(height: 20),
            PostCard(
              title: title,
              body: body,
              date: date,
            ),
            const SizedBox(height: 20),
            CustomTitle(title: "Comentarios de la publicación"),
            const SizedBox(height: 10),
            CommentsSection(
             postId: id
            ),
          ],
        ),
      ),
    );
  }
}
