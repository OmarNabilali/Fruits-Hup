import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/core/cubits/cart_cubit/cart_item_cubit.dart';
import 'package:fruits/core/cubits/cart_cubit/cart_item_state.dart';
import 'package:fruits/features/home/presentation/views/widgets/custom_cart_product.dart';

class CustomListViewCartProduct extends StatelessWidget {
  const CustomListViewCartProduct({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      builder: (context, state) {
        var cubit = BlocProvider.of<CartItemCubit>(context).cartEntity;

        return SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return CustomCartProduct(cartItemEntity: cubit.cartItems[index]);
          }, childCount: cubit.cartItems.length),
        );
      },
    );
  }
}
