import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentpal/features/my_orders/domain/usecase/get_orders.dart';

import 'package:rentpal/features/my_orders/presentation/bloc/my_order_event.dart';
import 'package:rentpal/features/my_orders/presentation/bloc/my_order_state.dart';

class MyOrderBloc extends Bloc<MyOrderEvent, MyOrderState> {
  MyOrderBloc(this._getMyOrders) : super(MyOrderInitial()) {
    on<GetOrders>(_onGetOrder);
  }
  final GetMyOrders _getMyOrders;

  void _onGetOrder(GetOrders event, Emitter<MyOrderState> emit) async {
    final result = await _getMyOrders.call();
    result.fold((l) => emit(MyOrderError(err: l.errorMessage)),
        (r) => emit(MyOrderSuccess(orderData: r)));
  }
}
