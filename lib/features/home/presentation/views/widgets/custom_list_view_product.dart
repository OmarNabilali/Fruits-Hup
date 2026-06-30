import 'package:flutter/cupertino.dart';
import 'package:fruits/features/home/presentation/views/widgets/custom_product_featured.dart';

class CustomListViewProduct extends StatelessWidget {
  const CustomListViewProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: CustomProductFeatured(),
          );
        },
      ),
    );
  }
}
