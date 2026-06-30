import 'package:fruits/core/entitys/cart_item_entity.dart';
import 'package:fruits/core/entitys/product_entity.dart';

class CartEntity {
  final List<CartItemEntity> cartItems;

  CartEntity(this.cartItems);

  bool isExist(ProductEntity productEntity) {
    for (var product in cartItems) {
      if (product.productEntity.id == productEntity.id) {
        return true;
      }
    }
    return false;
  }

  num totalPrice() {
    num totalPrice = 0;
    for (var items in cartItems) {
      totalPrice += items.totalPrice();
    }
    return totalPrice;
  }

  void addCartItem(CartItemEntity cartItemEntity) {
    cartItems.add(cartItemEntity);
  }

  void removeCartItem(CartItemEntity cartItemEntity) {
    cartItems.remove(cartItemEntity);
  }
}
