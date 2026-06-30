import 'package:fruits/core/utils/functions/get_currency.dart';
import 'package:fruits/features/check_out/domain/entitis/order_entity.dart';

import 'details.dart';

class Amount {
  String? total;
  String? currency;
  DetailsEntity? details;

  Amount({this.total, this.currency, this.details});

  factory Amount.fromEntity(OrderEntity orderEntity) {
    return Amount(
      currency: getCurrency(),
      details: DetailsEntity.fromEntity(orderEntity),
      total: orderEntity.calculateTotal().toString(),
    );
  }
  Map<String, dynamic> toJson() => {
    'total': total,
    'currency': currency,
    'details': details?.toJson(),
  };
}
