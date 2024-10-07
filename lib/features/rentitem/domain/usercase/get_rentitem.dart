import 'package:fpdart/fpdart.dart';
import 'package:rentpal/core/error/faliure.dart';
import 'package:rentpal/core/usecases/usecases.dart';
import 'package:rentpal/features/rentitem/domain/entity/rentitem_entity.dart';
import 'package:rentpal/features/rentitem/domain/repository/rentitem_repository.dart';

class GetRentitem
    implements UseCase<Either<Failure, List<RentitemEntity>>, void> {
  final RentitemRepository _rentitemRepository;
  GetRentitem(this._rentitemRepository);

  @override
  Future<Either<Failure, List<RentitemEntity>>> call({void params}) async {
    return await _rentitemRepository.getRentitem();
  }
}
