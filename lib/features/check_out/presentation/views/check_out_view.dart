import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/core/cubits/orders_cubti/orders_cubit.dart';
import 'package:fruits/core/entitys/cart_entity.dart';
import 'package:fruits/core/helper_functions/get_string.dart';
import 'package:fruits/core/repos/orders_repo/orders_repo_impl.dart';
import 'package:fruits/core/services/firestore_service.dart';
import 'package:fruits/core/utils/app_assets.dart';
import 'package:fruits/features/check_out/domain/entitis/order_entity.dart';
import 'package:fruits/features/check_out/domain/entitis/shipping_adress.dart';
import 'package:fruits/features/check_out/presentation/views/widgets/add_orders_bloc_builder.dart';
import 'package:fruits/features/check_out/presentation/views/widgets/custom_check_out_view_body.dart';
import 'package:provider/provider.dart';

class CheckOutView extends StatefulWidget {
  const CheckOutView({super.key, required this.cartEntity});
  static const routeName = 'checkout';
  final CartEntity cartEntity;

  @override
  State<CheckOutView> createState() => _CheckOutViewState();
}

class _CheckOutViewState extends State<CheckOutView> {
  late OrderEntity orderEntity;
  @override
  void initState() {
    super.initState();
    orderEntity = OrderEntity(
      shippingAdress: ShippingAdressEntity(),
      cartEntity: widget.cartEntity,
      uid: getUser().uid,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrdersCubit(OrdersRepoImpl(FirestoreService())),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset(AppAssets.arrow),
          ),
          title: Text(
            'الشحن',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        body: Provider.value(
          value: orderEntity,
          child: AddOrdersBlocBuilder(child: CustomCheckOutViewBody()),
        ),
      ),
    );
  }
}
