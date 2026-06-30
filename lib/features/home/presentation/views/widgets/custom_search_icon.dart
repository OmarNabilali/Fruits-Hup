import 'package:flutter/material.dart';

class CustomSearchIcon extends StatelessWidget {
  const CustomSearchIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: InputBorder.none,
        suffixIcon: IconButton(
          onPressed: () {},
          icon: Icon(Icons.settings_accessibility),
        ),
        prefixIcon: Row(
          children: [
            Text('ابحث عن '),
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          ],
        ),
      ),
    );

    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            Text('ابحث عن '),
          ],
        ),

        IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
      ],
    );
  }
}
