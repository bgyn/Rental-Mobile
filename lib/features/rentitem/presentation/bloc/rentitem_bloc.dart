import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentpal/features/rentitem/domain/usercase/get_rentitem.dart';
import 'package:rentpal/features/rentitem/presentation/bloc/rentitem_event.dart';
import 'package:rentpal/features/rentitem/presentation/bloc/rentitem_state.dart';

class RentitemBloc extends Bloc<RentitemEvent, RentitemState> {
  final GetRentitem _getRentitem;
  RentitemBloc(this._getRentitem) : super(RentItemLoading()) {
    on<FetchRentItem>(_onFetchRentItem);
  }

  _onFetchRentItem(FetchRentItem event, Emitter<RentitemState> emit) async {
    final data = await _getRentitem.call();
    data.fold(
      (l) => emit(RentItemLoading()),
      (r) => emit(RentItemSuccess(data: r)),
    );
  }
}
