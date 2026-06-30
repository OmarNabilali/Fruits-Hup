import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.suffixIcon,
    this.controller,
    this.textInputType,
    this.obcureText,
    this.onSaved,
  });
  final String hintText;
  final Function(String?)? onSaved;
  final IconButton? suffixIcon;
  final TextEditingController? controller;
  final bool? obcureText;
  final TextInputType? textInputType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      obscureText: obcureText ?? false,
      keyboardType: textInputType,
      validator: (v) {
        if (v!.isEmpty) {
          return 'field is required';
        } else {
          return null;
        }
      },
      controller: controller,
      decoration: InputDecoration(
        fillColor: Color(0xffF9FAFA),
        filled: true,
        suffixIcon: suffixIcon,
        hintText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
      ),
    );
  }
}
