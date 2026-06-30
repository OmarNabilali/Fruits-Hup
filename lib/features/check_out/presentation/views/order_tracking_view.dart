import 'package:flutter/material.dart';
import 'package:fruits/core/utils/app_assets.dart';
import 'package:fruits/features/check_out/presentation/views/widgets/order_tracking_view_body.dart';
import 'package:fruits/features/onboarding/presentation/views/widgets/custom_onboarding_view.dart';

class OrderTrackingView extends StatelessWidget {
  const OrderTrackingView({super.key});
  static const routeName = 'order';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('تتبع الطلب'),
        leading: Image.asset(AppAssets.arrow),
      ),

      body: OrderTrackingViewBody(),
    );
  }
}
