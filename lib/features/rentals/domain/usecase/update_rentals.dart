import 'package:fpdart/fpdart.dart';
import 'package:rentpal/core/error/faliure.dart';
import 'package:rentpal/core/usecases/usecases.dart';
import 'package:rentpal/features/rentals/domain/repository/rentals_repository.dart';

class UpdateRentals extends UseCase<Either<Failure, void>, int> {
  final RentalsRepository _rentalsRepository;

  UpdateRentals(this._rentalsRepository);

  @override
  Future<Either<Failure, void>> call({int? params}) async {
    return await _rentalsRepository.updateRentals(params!);
  }
}
