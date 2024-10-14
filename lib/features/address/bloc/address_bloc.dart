import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentpal/features/address/bloc/address_event.dart';
import 'package:rentpal/features/address/bloc/address_state.dart';
import 'package:rentpal/features/address/domain/usecases/get_address_list.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  final GetAddressList _addressList;
  AddressBloc(this._addressList) : super(AddressInitial()) {
    on<SearchAddress>(_onSearchAddress);
    on<ResetAddress>(_resetAddress);

  }

  _onSearchAddress(SearchAddress event, Emitter<AddressState> emit) async {
    final data =
        await _addressList.call(params: AddressParams(query: event.query));
    data.fold(
        (l) => emit(AddressFaliure()), (r) => emit(AddressSuccess(data: r)));
  }

  _resetAddress(ResetAddress event,Emitter<AddressState> emit){
    emit(AddressInitial());
  }
}
