import 'package:flutter/material.dart';

class CustomOtherLogin extends StatelessWidget {
  const CustomOtherLogin({
    super.key,
    required this.loginName,
    this.image,
    this.onTap,
  });
  final String loginName;
  final String? image;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: const Color(0xffDDDFDF)),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Image.asset((image!)),
            const SizedBox(width: 13),
            Text(loginName, style: const TextStyle(fontSize: 22)),
          ],
        ),
      ),
    );
  }
}
