import 'package:fruits/core/entitys/cart_entity.dart';
import 'package:fruits/features/check_out/domain/entitis/shipping_adress.dart';

class OrderEntity {
  final String uid;
  final ShippingAdressEntity shippingAdress;
  bool? isPaymentCashed;
  final CartEntity cartEntity;

  OrderEntity({
    this.isPaymentCashed,
    required this.cartEntity,
    required this.uid,
    required this.shippingAdress,
  });

  double calculateSubTotal() {
    return cartEntity.totalPrice().toDouble(); // مجموع المنتجات
  }

  double calculateShippingCost() {
    return 30;
  }

  double calculateDiscound() {
    return 0;
  }

  double calculateTotal() {
    return calculateSubTotal() + calculateShippingCost() - calculateDiscound();
  }
}
