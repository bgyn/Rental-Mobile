import 'package:fpdart/fpdart.dart';
import 'package:rentpal/core/error/faliure.dart';
import 'package:rentpal/features/rentitem/domain/entity/rentitem_entity.dart';

abstract class SearchRepository {
  Future<Either<Failure, List<RentitemEntity>>> search(String query);
}
