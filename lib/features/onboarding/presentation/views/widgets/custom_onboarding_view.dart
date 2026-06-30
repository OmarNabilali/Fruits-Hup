import 'package:flutter/material.dart';

class CustomOnboardingViewBody extends StatelessWidget {
  const CustomOnboardingViewBody({
    super.key,
    required this.img,
    this.title,
    this.subtitle,
    this.message,
    required this.content,
    this.titleColor,
    this.subtitleColor,
  });
  final String img;
  final String? title;
  final String? subtitle;
  final String? message;
  final Color? titleColor;
  final Color? subtitleColor;
  final String content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(img),
          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                message ?? '',
                style: const TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                subtitle ?? '',
                style: TextStyle(
                  color: subtitleColor,
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                title ?? '',
                style: TextStyle(
                  color: titleColor,
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Text(
            content,
            style: const TextStyle(fontSize: 20, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
