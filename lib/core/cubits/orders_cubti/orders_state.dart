part of 'orders_cubit.dart';

sealed class OrdersState {}

final class OrdersInitialState extends OrdersState {}

final class OrdersLoadingState extends OrdersState {}

final class OrdersFailure extends OrdersState {
  final String errMessage;

  OrdersFailure({required this.errMessage});
}

final class OrdersSuccess extends OrdersState {}
