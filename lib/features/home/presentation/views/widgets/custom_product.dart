import 'package:flutter/material.dart';
import 'package:fruits/core/utils/app_assets.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 55,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Favorite Icon
          Align(
            alignment: Alignment.topRight,
            child: Icon(Icons.favorite_border, size: 20),
          ),

          // Image
          Center(
            child: Image.asset(
              AppAssets.watermelon, // غير المسار حسب عندك
              height: 50,
            ),
          ),

          const SizedBox(height: 55),

          // Name
          const Text(
            'بطيخ',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 4),

          // Price + Button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '20 جنيه / كيلو',
                style: TextStyle(fontSize: 12, color: Colors.orange),
              ),
              const SizedBox(height: 55),
              // Add Button
              Container(
                height: 35,
                decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),

                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.add, color: Colors.white),
                  iconSize: 15,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
