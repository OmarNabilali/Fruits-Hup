import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class IsSelectedSteps extends StatelessWidget {
  const IsSelectedSteps({
    super.key,
    required this.isSelected,
    required this.text,
    required this.index,
  });
  final bool isSelected;
  final String text;
  final int index;
  @override
  Widget build(BuildContext context) {
    return isSelected
        ? CustomActiveSteps(text: text)
        : CustomInActiveSteps(text: text, index: index);
  }
}

class CustomActiveSteps extends StatelessWidget {
  const CustomActiveSteps({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(children: [Text(text), Image.asset('assets/images/select.png')]);
  }
}

class CustomInActiveSteps extends StatelessWidget {
  const CustomInActiveSteps({
    super.key,
    required this.text,
    required this.index,
  });
  final String text;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(radius: 15, child: Text('$index')),
        SizedBox(width: 8),
        Text(text),
      ],
    );
  }
}
