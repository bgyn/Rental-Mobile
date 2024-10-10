import 'dart:convert';
import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:rentpal/core/error/faliure.dart';
import 'package:rentpal/features/address/data/datasource/remote/address_api_service.dart';
import 'package:rentpal/features/address/domain/entity/address_entity.dart';
import 'package:rentpal/features/address/domain/repository/address_repository.dart';

class AddressRespositoryImpl implements AddressRepository {
  final AddressApiService _addressApiService;
  AddressRespositoryImpl(
    this._addressApiService,
  );

  @override
  Future<Either<Failure, List<AddressEntity>>> getAddressList(
      {required String query}) async {
    try {
      final response = await _addressApiService.getAddressList(query);
      final List jsonList = jsonDecode(response.body);
      final data = AddressEntity.fromJsonList(jsonList);
      return right(data);
    } on SocketException {
      return left(const ServerFailure("No internet connection"));
    } on HttpException {
      return left(const ServerFailure("Couldn't find the resource"));
    } on FormatException {
      return left(const ServerFailure("Bad response format"));
    } catch (e) {
      return left(ServerFailure("$e"));
    }
  }
}
