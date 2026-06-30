import 'package:flutter/material.dart';

void showSnackBarWidget(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: Duration(seconds: 1),
      content: Text(message, style: TextStyle(fontSize: 18)),
      backgroundColor: Colors.green,
    ),
  );
}
