import 'package:flutter/material.dart';

class CustomOrderTrackingCard extends StatelessWidget {
  const CustomOrderTrackingCard({
    super.key,
    required this.img,
    required this.title,
    required this.subtitle,
    required this.color,
  });
  final String img;
  final String title;
  final String subtitle;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      color: Color(0xffF2F3F3),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: color,
            radius: 20,
            child: Image.asset(img),
          ),
          SizedBox(width: 30),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text(title), Text(subtitle)],
          ),
        ],
      ),
    );
  }
}
