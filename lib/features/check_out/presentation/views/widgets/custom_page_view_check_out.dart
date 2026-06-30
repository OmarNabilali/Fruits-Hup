import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fruits/features/check_out/presentation/views/widgets/custom_address.dart';
import 'package:fruits/features/check_out/presentation/views/widgets/custom_shipping.dart';
import 'package:fruits/features/check_out/presentation/views/payment.dart';

class CustomPageViewCheckOut extends StatelessWidget {
  const CustomPageViewCheckOut({
    super.key,
    required this.controller,
    this.onPageChanged,
    required this.formKey,
    required this.valueListenable,
  });
  final Function(int)? onPageChanged;
  final GlobalKey<FormState> formKey;
  final PageController controller;
  final ValueListenable<AutovalidateMode> valueListenable;
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      onPageChanged: onPageChanged,
      physics: const NeverScrollableScrollPhysics(),
      controller: controller,
      itemCount: checkOutList().length,
      itemBuilder: (context, index) {
        return checkOutList()[index];
      },
    );
  }

  List<Widget> checkOutList() {
    return [
      CustomShipping(),
      CustomAddress(formKey: formKey, valueListenable: valueListenable),
      Payment(controller: controller),
    ];
  }
}
