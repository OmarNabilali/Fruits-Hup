import 'package:fruits/core/entitys/product_entity.dart';

class CartItemEntity {
  final ProductEntity productEntity;
  int quantity;
  CartItemEntity({required this.productEntity, this.quantity = 0});

  num totalPrice() {
    return productEntity.price * quantity;
  }

  int calculateUnitAmount() {
    return productEntity.quantity * quantity;
  }
}
