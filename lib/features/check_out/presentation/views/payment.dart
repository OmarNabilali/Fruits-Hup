import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/features/check_out/domain/entitis/order_entity.dart';

class Payment extends StatelessWidget {
  const Payment({super.key, required this.controller});
  final PageController controller;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xffF2F3F380)),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "ملخص الطلب :",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            _buildRow(
              "المجموع الفرعي :",
              "${context.read<OrderEntity>().cartEntity.totalPrice()} جنيه",
            ),
            const SizedBox(height: 6),
            _buildRow("التوصيل :", "30 جنيه"),
            const Divider(height: 20),

            _buildRow(
              "الكلي",
              "${context.read<OrderEntity>().cartEntity.totalPrice() + 30} جنيه",
              isBold: true,
            ),

            const SizedBox(height: 20),

            /// ===== عنوان التوصيل =====
            const Text(
              "عنوان التوصيل",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            Row(
              children: [
                const Icon(Icons.location_on_outlined, size: 20),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    "${context.read<OrderEntity>().shippingAdress?.address}",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                TextButton.icon(
                  onPressed: () {
                    controller.animateToPage(
                      controller.page!.toInt() - 1,
                      duration: Duration(milliseconds: 450),
                      curve: Curves.easeIn,
                    );
                  },
                  icon: const Icon(Icons.edit, size: 18),
                  label: const Text("تعديل"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(String title, String value, {bool isBold = false}) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        const Spacer(),
        Text(
          value,
          style: TextStyle(
            fontSize: 14,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
