import 'package:fpdart/fpdart.dart';

import 'package:rentpal/core/error/faliure.dart';
import 'package:rentpal/core/usecases/usecases.dart';
import 'package:rentpal/features/address/domain/entity/address_entity.dart';
import 'package:rentpal/features/address/domain/repository/address_repository.dart';

class GetAddressList
    implements UseCase<Either<Failure, List<AddressEntity>>, AddressParams> {
  final AddressRepository _addressRepository;
  GetAddressList(
    this._addressRepository,
  );
  @override
  Future<Either<Failure, List<AddressEntity>>> call(
      {AddressParams? params}) async {
    return _addressRepository.getAddressList(query: params?.query ?? "");
  }
}

class AddressParams {
  final String query;
  AddressParams({
    required this.query,
  });
}
