import 'package:flutter/material.dart';
import 'package:fruits/core/utils/app_assets.dart';

class CustomProductFeatured extends StatelessWidget {
  const CustomProductFeatured({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 40,
      child: Image.asset(AppAssets.strawperry, height: 50, width: 50),
    );
  }
}
