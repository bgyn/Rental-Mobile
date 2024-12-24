import 'package:fpdart/fpdart.dart';
import 'package:rentpal/core/error/faliure.dart';
import 'package:rentpal/features/my_listing/domain/entity/my_listing_entity.dart';

abstract class MyListingRepository {
  Future<Either<Failure, List<MyListingEntity>>> getListings();

  Future<Either<Failure, void>> deleteListing(int id);

  // Future<Either<Failure, bool>> updateListing(MyListingEntity entity);
}
