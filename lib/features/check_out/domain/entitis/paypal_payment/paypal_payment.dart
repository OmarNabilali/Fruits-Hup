import 'package:fruits/features/check_out/domain/entitis/order_entity.dart';

import 'amount.dart';
import 'item_list.dart';

class PaypalPaymentEntity {
  Amount? amount;
  String? description;
  ItemList? itemList;

  PaypalPaymentEntity({this.amount, this.description, this.itemList});

  factory PaypalPaymentEntity.fromEntity(OrderEntity orderEntity) {
    return PaypalPaymentEntity(
      amount: Amount.fromEntity(orderEntity),
      description: 'payment',
      itemList: ItemList.fromEntity(orderEntity.cartEntity.cartItems),
    );
  }

  Map<String, dynamic> toJson() => {
    'amount': amount?.toJson(),
    'description': description,
    'item_list': itemList?.toJson(),
  };
}
