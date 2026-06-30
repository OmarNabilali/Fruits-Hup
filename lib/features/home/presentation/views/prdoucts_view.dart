import 'package:flutter/material.dart';
import 'package:fruits/core/utils/app_assets.dart';
import 'package:fruits/core/utils/widgets/custom_app_bar.dart';
import 'package:fruits/features/home/presentation/views/widgets/custom_search_icon.dart';
import 'package:fruits/features/home/presentation/views/widgets/custom_list_view_product.dart';
import 'package:fruits/features/home/presentation/views/widgets/custom_product.dart';

class PrdouctsView extends StatelessWidget {
  const PrdouctsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: CustomAppBar(
              text: 'المنتجات',
              actionWidget: Image.asset(AppAssets.checkedBox),
            ),
          ),

          SliverToBoxAdapter(child: SizedBox(height: 20)),
          SliverToBoxAdapter(child: CustomSearchIcon()),
          SliverToBoxAdapter(child: SizedBox(height: 25)),
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('منتجاتنا', style: TextStyle(fontSize: 20)),
                Icon(Icons.abc_sharp),
              ],
            ),
          ),

          SliverToBoxAdapter(child: CustomListViewProduct()),

          SliverToBoxAdapter(child: SizedBox(height: 20)),

          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('الاكثر مبيعا', style: TextStyle(fontSize: 20)),
                Text('المزيد', style: TextStyle(fontSize: 15)),
              ],
            ),
          ),
          SliverGrid.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 100 / 150,
            ),
            itemBuilder: (context, index) {
              return ProductCard();
            },
          ),
        ],
      ),
    );
  }
}
