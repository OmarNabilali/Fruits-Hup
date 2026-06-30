import 'package:flutter/material.dart';
import 'package:fruits/core/utils/app_assets.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({super.key, required this.isChecked});
  final bool isChecked;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      isChecked ? AppAssets.checkedBox : AppAssets.notcheckBox,
      height: 26,
      width: 26,
    );
  }
}
