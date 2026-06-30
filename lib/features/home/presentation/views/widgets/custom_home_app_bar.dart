import 'package:flutter/material.dart';
import 'package:fruits/core/helper_functions/get_string.dart';
import 'package:fruits/core/utils/app_assets.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // صورة البروفايل
        Row(
          children: [
            CircleAvatar(
              radius: 22,
              child: Image.asset(
                AppAssets.avocado, // غير المسار حسب مشروعك
              ),
            ),

            // النصوص
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'صباح الخير ..',
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),

                Text(
                  getUser().name,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
