sealed class CartItemState {}

final class CartItemInitial extends CartItemState {}

final class AddCartItemState extends CartItemState {}

final class RemovedCartItemState extends CartItemState {}

final class IncrementCartItemState extends CartItemState {}

final class DecrementCartItemState extends CartItemState {}
