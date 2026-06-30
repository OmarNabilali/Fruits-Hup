import 'package:fruits/features/check_out/domain/entitis/shipping_adress.dart';

class ShippingAdressModel {
  String? name;
  String? email;
  String? address;
  String? city;
  String? floor;
  String? phoneNumber;

  ShippingAdressModel({
    this.phoneNumber,
    this.name,
    this.email,
    this.address,
    this.city,
    this.floor,
  });
  factory ShippingAdressModel.fromEntity(
    ShippingAdressEntity shippingAddressEntity,
  ) {
    return ShippingAdressModel(
      phoneNumber: shippingAddressEntity.phoneNumber,
      name: shippingAddressEntity.name,
      address: shippingAddressEntity.address,
      city: shippingAddressEntity.city,
      email: shippingAddressEntity.email,
      floor: shippingAddressEntity.floor,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'address': address,
      'city': city,
      'floor': floor,
      'phoneNumber': phoneNumber,
    };
  }
}
