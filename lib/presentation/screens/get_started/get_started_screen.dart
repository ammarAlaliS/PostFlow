import 'package:flutter/material.dart';
import 'package:post_flow/presentation/common/custom_scaffold.dart';
import 'package:post_flow/presentation/screens/get_started/body.dart';


class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
   
    return CustomScaffold(
      body: const ScaffoldBody()
    );
  }
}


