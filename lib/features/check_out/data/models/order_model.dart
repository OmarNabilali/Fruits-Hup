import 'package:fruits/features/check_out/data/models/order_product_model.dart';
import 'package:fruits/features/check_out/data/models/shipping_address_model.dart';
import 'package:fruits/features/check_out/domain/entitis/order_entity.dart';
import 'package:uuid/uuid.dart';

class OrderModel {
  final String uid;
  final double totalPrice;
  final ShippingAdressModel shippingAdressModel;
  bool? isPaymentCashed;
  final List<OrderProductModel> orderProducts;
  final String orderId;

  OrderModel({
    this.isPaymentCashed,
    required this.shippingAdressModel,
    required this.uid,
    required this.totalPrice,
    required this.orderProducts,
    required this.orderId,
  });

  factory OrderModel.fromEntity(OrderEntity orderEntity) {
    print(orderEntity.cartEntity.cartItems.length);
    return OrderModel(
      uid: orderEntity.uid,
      shippingAdressModel: ShippingAdressModel.fromEntity(
        orderEntity.shippingAdress,
      ),
      isPaymentCashed: orderEntity.isPaymentCashed,
      totalPrice: orderEntity.cartEntity.totalPrice().toDouble(),
      orderProducts: orderEntity.cartEntity.cartItems
          .map((e) => OrderProductModel.fromEntity(e))
          .toList(),
      orderId: Uuid().v4(),
    );
  }

  Map<String, dynamic> toJson() {
    var uuid = Uuid();
    return {
      'orderId': orderId,
      'totalPrice': totalPrice,
      'date': DateTime.now(),
      'status': 'pending',
      'shippingAdress': shippingAdressModel.toJson(),
      'isPaymentCashed': isPaymentCashed,
      'uid': uid,
      'orderProducts': orderProducts.map((e) => e.toJson()).toList(),
    };
  }
}
