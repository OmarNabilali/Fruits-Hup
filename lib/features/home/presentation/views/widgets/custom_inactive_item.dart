import 'package:flutter/material.dart';

class CustomInactiveIcon extends StatelessWidget {
  const CustomInactiveIcon({super.key, required this.img});
  final String img;
  @override
  Widget build(BuildContext context) {
    return Image.asset(img);
  }
}
