import 'package:fpdart/fpdart.dart';
import 'package:rentpal/core/error/faliure.dart';
import 'package:rentpal/core/usecases/usecases.dart';
import 'package:rentpal/features/rentals/domain/entity/rentals_entity.dart';
import 'package:rentpal/features/rentals/domain/repository/rentals_repository.dart';

class GetRentals extends UseCase<Either<Failure,List<RentalsEntity>>,void>{
  final RentalsRepository repository;

  GetRentals(this.repository);

  @override
  Future<Either<Failure,List<RentalsEntity>>> call({void params}) async {
    return await repository.getRentals();
  }
}