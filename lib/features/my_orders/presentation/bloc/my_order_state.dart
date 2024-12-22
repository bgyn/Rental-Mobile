import 'package:rentpal/features/my_orders/domain/entity/my_order_entity.dart';

sealed class MyOrderState {
  final List<MyOrderEntity>? data;
  final String? errorMessage;
  MyOrderState({this.data, this.errorMessage});
}

class MyOrderInitial extends MyOrderState {}

class MyOrderSuccess extends MyOrderState {
  final List<MyOrderEntity> orderData;

  MyOrderSuccess({required this.orderData}) : super(data: orderData);
}

class MyOrderError extends MyOrderState {
  final String err;
  MyOrderError({required this.err}) : super(errorMessage: err);
}

class MyOrderLoading extends MyOrderState {}
