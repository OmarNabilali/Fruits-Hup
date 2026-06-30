import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/core/cubits/products_cubit/products_cubit.dart';
import 'package:fruits/core/repos/product_repo/product_repo_impl.dart';
import 'package:fruits/core/services/firestore_service.dart';
import 'package:fruits/features/home/presentation/views/widgets/custom_discound.dart';
import 'package:fruits/features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:fruits/features/home/presentation/views/widgets/custom_search_icon.dart';
import 'package:fruits/features/home/presentation/views/widgets/custom_sliver_grid_product.dart';

class CustomHomeViewBody extends StatelessWidget {
  const CustomHomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 40),
      child: BlocProvider(
        create: (context) =>
            ProductsCubit(ProductRepoImpl(FirestoreService()))..getProducts(),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: CustomHomeAppBar()),
            const SliverToBoxAdapter(child: SizedBox(height: 20)),
            const SliverToBoxAdapter(child: CustomSearchIcon()),
            const SliverToBoxAdapter(child: SizedBox(height: 15)),
            const SliverToBoxAdapter(child: CustomDiscound()),
            const SliverToBoxAdapter(child: SizedBox(height: 12)),

            // SliverToBoxAdapter(
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       GestureDetector(
            //         onTap: () {
            //           Navigator.pushNamed(context, BestSeller.bestSellerRoute);
            //         },
            //         child: Text('الاكثر مبيعا', style: TextStyle(fontSize: 20)),
            //       ),
            //       Text('المزيد', style: TextStyle(fontSize: 15)),
            //     ],
            //   ),
            // ),
            BlocBuilder<ProductsCubit, ProductsState>(
              builder: (context, state) {
                if (state is ProductsSuccess) {
                  return CustomSliverGridProduct(products: state.products);
                } else if (state is ProductsFailure) {
                  return SliverToBoxAdapter(child: Text('${state.errMessage}'));
                } else {
                  return SliverToBoxAdapter(
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
