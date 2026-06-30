import 'package:flutter/material.dart';
import 'package:fruits/core/entitys/product_entity.dart';
import 'package:fruits/features/home/presentation/views/widgets/custom_card_product.dart';

class CustomSliverGridProduct extends StatelessWidget {
  const CustomSliverGridProduct({super.key, required this.products});
  final List<ProductEntity> products;
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(16),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(childCount: products.length, (
          context,
          index,
        ) {
          print('Products length: ${products.length}');
          print('Products: ${products}');
          return CustomCardProduct(productEntity: products[index]);
        }),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 100 / 150,
        ),
      ),
    );
  }
}
