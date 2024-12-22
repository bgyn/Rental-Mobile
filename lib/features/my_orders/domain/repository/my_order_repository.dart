import 'package:fpdart/fpdart.dart';
import 'package:rentpal/core/error/faliure.dart';
import 'package:rentpal/features/my_orders/domain/entity/my_order_entity.dart';

abstract class MyOrderRepository {
  Future<Either<Failure, List<MyOrderEntity>>> getOrders();
}
