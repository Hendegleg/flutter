import 'package:flutter/material.dart';

class MyImageWidget extends StatelessWidget {
  final String imagePath;
  final double width;
  final double height;

  MyImageWidget({
    required this.imagePath,
    this.width = 200,
    this.height = 200,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      width: width,
      height: height,
    );
  }
}
