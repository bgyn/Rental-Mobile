// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';

import 'package:fpdart/fpdart.dart';

import 'package:rentpal/core/error/faliure.dart';
import 'package:rentpal/features/rentitem/data/datasource/remote/rentitem_api_service.dart';
import 'package:rentpal/features/rentitem/domain/entity/rentitem_entity.dart';
import 'package:rentpal/features/rentitem/domain/repository/rentitem_repository.dart';

class RentitemRepositoryImpl implements RentitemRepository {
  final RentitemApiService _rentitemApiService;
  RentitemRepositoryImpl(
    this._rentitemApiService,
  );

  @override
  Future<Either<Failure, List<RentitemEntity>>> getRentitem() async {
    try {
      final response = await _rentitemApiService.getRentItem();
      final List jsonList = jsonDecode(response.body);
      final result = jsonList.map((e) => RentitemEntity.fromMap(e)).toList();
      return right(result);
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
