

import 'package:rentpal/features/address/domain/entity/address_entity.dart';

abstract class AddressState {
  final List<AddressEntity>? address;
  AddressState({
    this.address,
  });
}

class AddressInitial extends AddressState {}

class AddressLoading extends AddressState {}

class AddressFaliure extends AddressState {}

class AddressSuccess extends AddressState {
  final List<AddressEntity> data;
  AddressSuccess({
    required this.data,
  }) : super(address: data);
}
