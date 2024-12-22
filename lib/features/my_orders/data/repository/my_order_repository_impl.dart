import 'dart:convert';
import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:rentpal/core/error/faliure.dart';
import 'package:rentpal/features/my_orders/data/datasource/remote/my_order_api_service.dart';
import 'package:rentpal/features/my_orders/domain/entity/my_order_entity.dart';
import 'package:rentpal/features/my_orders/domain/repository/my_order_repository.dart';

class MyOrderRepositoryImpl extends MyOrderRepository {
  final MyOrderApiService _apiService;
  MyOrderRepositoryImpl(this._apiService);
  @override
  Future<Either<Failure, List<MyOrderEntity>>> getOrders() async {
    try {
      final result = await _apiService.getOrders();
      if (result.statusCode == 200) {
        final List orderList = jsonDecode(result.body);
        final myorders = MyOrderEntity.fromJsonList(orderList);
        return right(myorders);
      }
      return left(const ServerFailure('Failed to get my orders!'));
    } on SocketException {
      return left(const ConnectionFailure("No internet connection"));
    } on HttpException {
      return left(const ServerFailure("Couldn't find the resource"));
    } on FormatException {
      return left(const ServerFailure("Bad response format"));
    } catch (e) {
      return left(ServerFailure("$e"));
    }
  }
}
