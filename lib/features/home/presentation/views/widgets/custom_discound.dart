import 'package:flutter/material.dart';

class CustomDiscound extends StatelessWidget {
  const CustomDiscound({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Image.asset('assets/images/Group.png'),
          );
        },
      ),
    );
  }
}
