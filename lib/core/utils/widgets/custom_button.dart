import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.buttonName, this.onPressed});
  final String buttonName;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: MaterialButton(
        minWidth: 310,
        height: 50,
        onPressed: onPressed,

        color: Color(0xff1B5E37),
        child: Text(
          buttonName,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
