import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/core/cubits/orders_cubti/orders_cubit.dart';
import 'package:fruits/core/utils/functions/show_snack_bar_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AddOrdersBlocBuilder extends StatelessWidget {
  const AddOrdersBlocBuilder({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrdersCubit, OrdersState>(
      listener: (context, state) {
        if (state is OrdersSuccess) {
          showSnackBarWidget(context, 'تمت العمليه بنجاح');
        } else if (state is OrdersFailure) {
          showSnackBarWidget(context, '${state.errMessage}');
        }
      },

      builder: (context, state) {
        return Skeletonizer(enabled: state is OrdersLoadingState, child: child);
      },
    );
  }
}
