import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/core/cubits/cart_cubit/cart_item_cubit.dart';
import 'package:fruits/core/cubits/cart_cubit/cart_item_state.dart';
import 'package:fruits/core/entitys/cart_item_entity.dart';

import 'package:fruits/core/utils/app_assets.dart';

class CustomCartProduct extends StatelessWidget {
  const CustomCartProduct({super.key, required this.cartItemEntity});
  final CartItemEntity cartItemEntity;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Color(0xffF3F5F7)),
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 90,
                  width: 40,
                  color: const Color(0xffF3F5F7),
                  child: Image.network(cartItemEntity.productEntity.imgUrl),
                ),

                Column(
                  children: [
                    Text(
                      '${cartItemEntity.productEntity.title}',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      'كيلو / ${cartItemEntity.calculateUnitAmount()} ',
                      style: TextStyle(fontSize: 20),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              context.read<CartItemCubit>().increesCount(
                                cartItemEntity.productEntity,
                              );
                            },
                            child: Image.asset(AppAssets.add, height: 20),
                          ),
                          const SizedBox(width: 10),
                          Text('${cartItemEntity.quantity}'),

                          const SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {
                              context.read<CartItemCubit>().decreesCount(
                                cartItemEntity.productEntity,
                              );
                            },
                            child: Image.asset(AppAssets.minmimz, height: 20),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),

            Column(
              children: [
                IconButton(
                  onPressed: () {
                    BlocProvider.of<CartItemCubit>(
                      context,
                    ).RemoveItemOfCart(cartItemEntity);
                  },
                  icon: const Icon(Icons.delete),
                ),

                const SizedBox(height: 20),

                Text("${cartItemEntity.totalPrice()}"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
