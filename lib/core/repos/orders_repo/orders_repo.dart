import 'package:dartz/dartz.dart';
import 'package:fruits/core/errors/failure.dart';
import 'package:fruits/features/check_out/domain/entitis/order_entity.dart';

abstract class OrdersRepo {
  Future<Either<Failure, void>> addOrders(OrderEntity orderEntiy);
}
