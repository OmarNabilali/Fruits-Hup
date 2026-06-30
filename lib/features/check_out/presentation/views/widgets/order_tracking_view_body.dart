import 'package:flutter/cupertino.dart';
import 'package:fruits/core/utils/app_assets.dart';
import 'package:fruits/features/check_out/presentation/views/widgets/custom_order_tracking_card.dart';
import 'package:fruits/features/check_out/presentation/views/widgets/order_details_widget.dart';

class OrderTrackingViewBody extends StatelessWidget {
  const OrderTrackingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: ListView(
        children: [
          OrderDetailsWidget(),
          const SizedBox(height: 20),

          CustomOrderTrackingCard(
            color: Color(0xffEBF9F1),
            title: 'تتبع الطلب',
            subtitle: '255',
            img: AppAssets.one,
          ),
          const SizedBox(height: 10),
          CustomOrderTrackingCard(
            color: Color(0xffEBF9F1),
            title: 'تتبع الطلب',
            subtitle: '255',
            img: AppAssets.one,
          ),
          const SizedBox(height: 10),

          CustomOrderTrackingCard(
            color: Color(0xffEBF9F1),
            title: 'تتبع الطلب',
            subtitle: '255',
            img: AppAssets.one,
          ),
          const SizedBox(height: 10),

          CustomOrderTrackingCard(
            color: Color(0xffEBF9F1),
            title: 'تتبع الطلب',
            subtitle: '255',
            img: AppAssets.one,
          ),
        ],
      ),
    );
  }
}
