import 'package:fruits/core/entitys/cart_entity.dart';
import 'package:fruits/core/entitys/cart_item_entity.dart';
import 'package:fruits/features/check_out/domain/entitis/order_entity.dart';

import 'item.dart';

class ItemList {
  List<Item>? items;

  ItemList({this.items});

  factory ItemList.fromEntity(List<CartItemEntity> itemEntity) {
    return ItemList(items: itemEntity.map((e) => Item.fromEntity(e)).toList());
  }

  Map<String, dynamic> toJson() => {
    'items': items?.map((e) => e.toJson()).toList(),
  };
}
