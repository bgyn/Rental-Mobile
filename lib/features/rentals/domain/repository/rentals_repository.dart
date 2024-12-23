import 'package:fpdart/fpdart.dart';
import 'package:rentpal/core/error/faliure.dart';
import 'package:rentpal/features/rentals/domain/entity/rentals_entity.dart';

abstract class RentalsRepository {
  Future<Either<Failure,List<RentalsEntity>>> getRentals();
  Future<Either<Failure,void>> updateRentals(int id);
}