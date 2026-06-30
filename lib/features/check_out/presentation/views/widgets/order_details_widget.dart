import 'package:flutter/material.dart';

class OrderDetailsWidget extends StatelessWidget {
  const OrderDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),

      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              shape: BoxShape.circle,

              color: const Color(0xFFF0F0F0),
            ),
            child: const Icon(
              Icons.inventory_2_outlined,
              size: 28,
              color: Color(0xFF666666),
            ),
          ),
          SizedBox(width: 20),
          // Order Info (RTL: this is the main content on the right side)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Order Number Title
                Text(
                  'طلب رقم: #45588',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
                const SizedBox(height: 4),
                // Order Date
                Text(
                  'تم الطلب: 22',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF888888),
                  ),
                ),
                const SizedBox(height: 10),
                // Items count and total price
                Row(
                  children: [
                    Text(
                      'عدد الطلبات: 5',
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color(0xFF444444),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      '${250} جنية',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1A1A1A),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Package Icon (left side in RTL)
        ],
      ),
    );
  }
}
