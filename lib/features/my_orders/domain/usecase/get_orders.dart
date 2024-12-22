import 'package:fpdart/fpdart.dart';
import 'package:rentpal/core/error/faliure.dart';
import 'package:rentpal/core/usecases/usecases.dart';
import 'package:rentpal/features/my_orders/domain/entity/my_order_entity.dart';
import 'package:rentpal/features/my_orders/domain/repository/my_order_repository.dart';

class GetMyOrders extends UseCase<Either<Failure, List<MyOrderEntity>>, void> {
  final MyOrderRepository _myOrderRepository;
  GetMyOrders(this._myOrderRepository);
  @override
  Future<Either<Failure, List<MyOrderEntity>>> call({void params}) async {
    return await _myOrderRepository.getOrders();
  }
}
