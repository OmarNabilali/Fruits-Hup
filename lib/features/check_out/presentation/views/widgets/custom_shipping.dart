import 'package:flutter/material.dart';
import 'package:fruits/core/utils/widgets/custom_button.dart';
import 'package:fruits/features/check_out/domain/entitis/order_entity.dart';
import 'package:fruits/features/check_out/presentation/views/widgets/custom_check_out_card.dart';
import 'package:provider/provider.dart';

class CustomShipping extends StatefulWidget {
  const CustomShipping({super.key});

  @override
  State<CustomShipping> createState() => _CustomShippingState();
}

class _CustomShippingState extends State<CustomShipping>
    with AutomaticKeepAliveClientMixin<CustomShipping> {
  int index = 0;
  int selectIndex = -1;

  @override
  Widget build(BuildContext context) {
    var orderEntity = context.read<OrderEntity>();
    return Column(
      children: [
        CustomCheckOutCard(
          onTap: () {
            setState(() {
              selectIndex = 0;
              orderEntity.isPaymentCashed = false;
            });
          },
          selectIndex: selectIndex,
          index: 0,
          title: 'الدفع عند الاستلام',
          subtitle: 'التسليم من المكان',
          price: '${context.read<OrderEntity>().cartEntity.totalPrice() + 40}',
        ),
        const SizedBox(height: 15),
        CustomCheckOutCard(
          onTap: () {
            setState(() {
              selectIndex = 1;
              orderEntity.isPaymentCashed = true;
            });
          },
          index: 1,
          selectIndex: selectIndex,
          title: 'اشتري الان وادفع لاحقا',
          subtitle: 'يرجي تحديد طريقه الدفع',
          price: context.read<OrderEntity>().cartEntity.totalPrice().toString(),
        ),
      ],
    );
  }

  @override
  void updateKeepAlive() {
    // TODO: implement updateKeepAlive
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
