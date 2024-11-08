// ignore_for_file: sized_box_for_whitespace

import 'dart:ui';
import 'package:flutter/material.dart';


class BasicAppSelectTheme extends StatelessWidget {
  final Color initialCircleColor;
  final Widget initialIcon;
  final String labelText;
  final Color initialBorderColor;
  final Color textColor;
  final VoidCallback onTap; 
  final double circleSize; 

  const BasicAppSelectTheme({
    super.key,
    required this.initialCircleColor,
    required this.initialIcon,
    required this.labelText,
    required this.initialBorderColor,
    required this.textColor,
    required this.onTap,
    this.circleSize = 80, 
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, 
      child: Column(
        children: [
          ClipOval(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                height: circleSize,
                width: circleSize,
                decoration: BoxDecoration(
                  color: initialCircleColor.withOpacity(0.9),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: initialBorderColor.withOpacity(0.2),
                    width: 1.0,
                    style: BorderStyle.solid,
                  ),
                ),
                child: Center( 
                  child: Container(
                    height: circleSize * 0.5, 
                    width: circleSize * 0.5, 
                    child: initialIcon,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            labelText,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}