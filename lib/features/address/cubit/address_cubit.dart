import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentpal/features/address/domain/entity/address_entity.dart';

class AddressCubit extends Cubit<List<AddressEntity>> {
  AddressCubit() : super([]);

  void addAddress(AddressEntity address) {
    final updatedAddresses = [address];
    emit(updatedAddresses); 
  }

  void reset() {
    emit([]);
  }
}
