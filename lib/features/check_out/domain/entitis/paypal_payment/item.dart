import 'package:fruits/core/entitys/cart_item_entity.dart';
import 'package:fruits/core/utils/functions/get_currency.dart';

class Item {
  String? name;
  int? quantity;
  String? price;
  String? currency;

  Item({this.name, this.quantity, this.price, this.currency});

  factory Item.fromEntity(CartItemEntity cartItemEntity) {
    return Item(
      currency: getCurrency(),
      name: cartItemEntity.productEntity.title,
      price: cartItemEntity.productEntity.price.toString(),
      quantity: cartItemEntity.quantity,
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'quantity': quantity,
    'price': price,
    'currency': currency,
  };
}
