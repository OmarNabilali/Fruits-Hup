import 'package:fruits/features/check_out/domain/entitis/order_entity.dart';

class DetailsEntity {
  String? subtotal;
  String? shipping;
  int? shippingDiscount;

  DetailsEntity({this.subtotal, this.shipping, this.shippingDiscount});

  factory DetailsEntity.fromJson(Map<String, dynamic> json) => DetailsEntity(
    subtotal: json['subtotal'] as String?,
    shipping: json['shipping'] as String?,
    shippingDiscount: json['shipping_discount'] as int?,
  );

  factory DetailsEntity.fromEntity(OrderEntity orderEntity) {
    return DetailsEntity(
      shipping: orderEntity.calculateShippingCost().toString(),

      shippingDiscount: orderEntity.calculateDiscound().toInt(),
      subtotal: orderEntity.cartEntity.totalPrice().toString(),
    );
  }

  Map<String, dynamic> toJson() => {
    'subtotal': subtotal,
    'shipping': shipping,
    'shipping_discount': shippingDiscount,
  };
}
