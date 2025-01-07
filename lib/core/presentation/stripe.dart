import 'package:flutter/material.dart';

class Stripe extends StatelessWidget {
  final String imagePath;
  final double topPosition;
  final double height;
  final double? rightPosition;

  const Stripe({
    Key? key,
    required this.imagePath,
    required this.topPosition,
    required this.height,
    this.rightPosition,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: topPosition,
      left: 0,
      right: rightPosition ?? 0, 
      child: Image.asset(
        imagePath,
        fit: BoxFit.contain,
        height: MediaQuery.of(context).size.height * height,
      ),
    );
  }
}
