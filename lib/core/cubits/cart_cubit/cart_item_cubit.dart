import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/core/cubits/cart_cubit/cart_item_state.dart';
import 'package:fruits/core/entitys/cart_entity.dart';
import 'package:fruits/core/entitys/cart_item_entity.dart';
import 'package:fruits/core/entitys/product_entity.dart';

class CartItemCubit extends Cubit<CartItemState> {
  CartItemCubit() : super(CartItemInitial());

  CartEntity cartEntity = CartEntity([]);

  void addItemCart(ProductEntity productEntity) {
    bool isProductExist = cartEntity.isExist(productEntity);

    if (isProductExist) {
      for (var item in cartEntity.cartItems) {
        if (item.productEntity == productEntity) {
          item.quantity++;
          emit(IncrementCartItemState());

          /// 👈 هنا بنزود الكاونت
          break; // وقف اللوب عشان لقيناه
        }
      }
    } else {
      cartEntity.cartItems.add(
        CartItemEntity(productEntity: productEntity, quantity: 1),
      );
    }

    emit(AddCartItemState());
  }

  void RemoveItemOfCart(CartItemEntity cartItemEntity) {
    cartEntity.removeCartItem(cartItemEntity);
    emit(RemovedCartItemState());
  }

  void increesCount(ProductEntity productEntity) {
    for (var item in cartEntity.cartItems) {
      if (item.productEntity.id == productEntity.id) {
        item.quantity++;
        emit(IncrementCartItemState());
      }
    }
  }

  void decreesCount(ProductEntity productEntity) {
    for (var item in cartEntity.cartItems) {
      if (item.productEntity.id == productEntity.id) {
        if (item.quantity > 1) {
          item.quantity--;
        }
        emit(DecrementCartItemState());
      }
    }
  }
}
