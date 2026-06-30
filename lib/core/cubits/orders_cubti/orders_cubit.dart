import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fruits/core/repos/orders_repo/orders_repo.dart';
import 'package:fruits/features/check_out/domain/entitis/order_entity.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit(this.ordersRepo) : super(OrdersInitialState());
  OrdersRepo ordersRepo;
  Future<void> addOrders({required OrderEntity orderEntity}) async {
    emit(OrdersLoadingState());
    var result = await ordersRepo.addOrders(orderEntity);

    result.fold(
      (failure) {
        emit(OrdersFailure(errMessage: failure.errMessage));
      },
      (success) {
        emit(OrdersSuccess());
      },
    );
  }
}
