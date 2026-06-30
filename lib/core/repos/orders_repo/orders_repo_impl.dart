import 'package:dartz/dartz.dart';
import 'package:fruits/core/errors/failure.dart';
import 'package:fruits/core/repos/orders_repo/orders_repo.dart';
import 'package:fruits/core/services/database_service.dart';
import 'package:fruits/core/utils/backend_endpoint.dart';
import 'package:fruits/features/check_out/data/models/order_model.dart';
import 'package:fruits/features/check_out/domain/entitis/order_entity.dart';

class OrdersRepoImpl extends OrdersRepo {
  final DatabaseService databaseService;

  OrdersRepoImpl(this.databaseService);
  @override
  Future<Either<Failure, void>> addOrders(OrderEntity orderEntiy) async {
    try {
      var orderModel = OrderModel.fromEntity(orderEntiy);
      var data = await databaseService.addData(
        path: BackendEndpoint.orders,
        documentId: orderModel.orderId,
        data: orderModel.toJson(),
      );

      return right(null);
    } catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
