import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/core/cubits/cart_cubit/cart_item_cubit.dart';
import 'package:fruits/core/cubits/cart_cubit/cart_item_state.dart';
import 'package:fruits/core/utils/app_assets.dart';
import 'package:fruits/core/utils/widgets/custom_app_bar.dart';
import 'package:fruits/core/utils/widgets/custom_button.dart';
import 'package:fruits/features/check_out/presentation/views/check_out_view.dart';
import 'package:fruits/features/home/presentation/views/widgets/custom_list_view_cart_product.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: 'سله التسوق',
        leadingWidget: Image.asset(AppAssets.arrow),
      ),

      body: BlocBuilder<CartItemCubit, CartItemState>(
        builder: (context, state) {
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Color(0xffEBF9F1),
                  ),
                  child: Center(
                    child: Text(
                      'لديك ${BlocProvider.of<CartItemCubit>(context).cartEntity.cartItems.length} منتجات في سله التسوق',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 20)),
              BlocListener<CartItemCubit, CartItemState>(
                listener: (context, state) {
                  if (state is AddCartItemState) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text('تم اضافه المنتج')));
                  } else if (state is RemovedCartItemState) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text('تم حذف المنتج')));
                  }
                },
                child: const CustomListViewCartProduct(),
              ),

              const SliverToBoxAdapter(child: SizedBox(height: 200)),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child:
                      BlocProvider.of<CartItemCubit>(
                        context,
                      ).cartEntity.cartItems.isEmpty
                      ? SizedBox()
                      : CustomButton(
                          buttonName:
                              '${BlocProvider.of<CartItemCubit>(context).cartEntity.totalPrice()}',
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              CheckOutView.routeName,
                              arguments: BlocProvider.of<CartItemCubit>(
                                context,
                              ).cartEntity,
                            );
                          },
                        ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
