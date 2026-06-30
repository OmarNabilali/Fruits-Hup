import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/core/utils/widgets/custom_text_field.dart';
import 'package:fruits/features/check_out/domain/entitis/order_entity.dart';

class CustomAddress extends StatelessWidget {
  const CustomAddress({
    super.key,
    required this.formKey,
    required this.valueListenable,
  });
  static const routeName = 'address';
  final GlobalKey<FormState> formKey;
  final ValueListenable<AutovalidateMode> valueListenable;
  @override
  Widget build(BuildContext context) {
    var shippingEntity = context.read<OrderEntity>().shippingAdress;

    return ValueListenableBuilder(
      valueListenable: valueListenable,
      builder: (context, value, child) => Form(
        key: formKey,
        autovalidateMode: value,
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextField(
                hintText: 'الاسم كامل ',
                onSaved: (value) {
                  shippingEntity.name = value!;
                },
              ),

              SizedBox(height: 12),
              CustomTextField(
                hintText: ' البريد الالكتروني ',
                onSaved: (value) {
                  shippingEntity.email = value!;
                },
              ),
              SizedBox(height: 12),
              CustomTextField(
                hintText: '  رقم الهاتف ',
                onSaved: (value) {
                  shippingEntity.phoneNumber = value!;
                },
              ),
              SizedBox(height: 12),
              CustomTextField(
                hintText: ' العنوان ',
                onSaved: (value) {
                  shippingEntity.address = value!;
                },
              ),
              SizedBox(height: 12),
              CustomTextField(
                hintText: 'المدينه  ',
                onSaved: (value) {
                  shippingEntity.city = value!;
                },
              ),
              SizedBox(height: 12),
              CustomTextField(
                hintText: 'رقم الطابق  ',
                onSaved: (value) {
                  shippingEntity.floor = value!;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
