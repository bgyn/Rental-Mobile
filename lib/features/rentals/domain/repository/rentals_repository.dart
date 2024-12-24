import 'package:fpdart/fpdart.dart';
import 'package:rentpal/core/error/faliure.dart';
import 'package:rentpal/features/rentals/domain/entity/rentals_entity.dart';
import 'package:rentpal/features/rentals/domain/usecase/update_rentals.dart';

abstract class RentalsRepository {
  Future<Either<Failure,List<RentalsEntity>>> getRentals();
  Future<Either<Failure,void>> updateRentals(UpdateRentalsPrams params);
}