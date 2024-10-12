import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentpal/features/address/domain/entity/address_entity.dart';

class AddressCubit extends Cubit<List<AddressEntity>> {
  AddressCubit() : super([]);

  void addAddress(AddressEntity address) {
    final updatedAddresses = List<AddressEntity>.from(state)..add(address);
    emit(updatedAddresses); // Emit the new list of addresses
  }

  void reset() {
    emit([]);
  }
}
