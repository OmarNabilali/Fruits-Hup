import 'package:flutter/material.dart';
import 'package:fruits/core/utils/app_assets.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.text,
    this.leadingWidget,
    this.actionWidget,
  });
  final String text;
  final Widget? leadingWidget;
  final Widget? actionWidget;

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(30);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [actionWidget ?? Text('')],
      centerTitle: true,
      title: Text(
        text,
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),

      leading: Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: leadingWidget ?? Text(''),
      ),
    );
  }
}
