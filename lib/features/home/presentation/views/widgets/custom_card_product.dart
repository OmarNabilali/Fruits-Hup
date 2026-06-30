import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/core/cubits/cart_cubit/cart_item_cubit.dart';
import 'package:fruits/core/entitys/product_entity.dart';
import 'package:fruits/core/utils/app_assets.dart';

class CustomCardProduct extends StatelessWidget {
  const CustomCardProduct({super.key, required this.productEntity});
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      color: Color(0xffF9FAFA),
      child: Stack(
        children: [
          Positioned(top: 5, right: 8, child: Icon(Icons.favorite_outline)),
          Positioned(
            top: 20,
            right: 0,
            left: 0,
            child: Image.network(productEntity.imgUrl, height: 100, width: 100),
          ),
          Positioned(right: 5, bottom: 60, child: Text(productEntity.title)),

          Positioned(
            bottom: 20,
            right: 5,
            left: 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [Text('${productEntity.price} '), Text('/الكيلو ')],
                ),
                GestureDetector(
                  onTap: () {
                    BlocProvider.of<CartItemCubit>(
                      context,
                    ).addItemCart(productEntity);
                  },
                  child: Image.asset(AppAssets.add, height: 20),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
