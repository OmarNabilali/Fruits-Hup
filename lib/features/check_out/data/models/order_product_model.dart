import 'dart:developer';

import 'package:fruits/core/entitys/cart_item_entity.dart';

class OrderProductModel {
  final String title;
  final num price;
  final String imgUrl;
  final int quantity;

  OrderProductModel({
    required this.title,
    required this.price,
    required this.imgUrl,
    required this.quantity,
  });
  factory OrderProductModel.fromEntity(CartItemEntity cartItemEntity) {
    log('name : ${cartItemEntity.productEntity.title}');

    return OrderProductModel(
      title: cartItemEntity.productEntity.title,
      price: cartItemEntity.productEntity.price,
      imgUrl: cartItemEntity.productEntity.imgUrl,
      quantity: cartItemEntity.quantity,
    );
  }

  toJson() {
    return {
      'title': title,
      'price': price,
      'imgUrl': imgUrl,
      'quantity': quantity,
    };
  }
}
