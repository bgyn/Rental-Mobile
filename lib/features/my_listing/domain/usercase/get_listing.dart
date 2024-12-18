import 'package:fpdart/fpdart.dart';
import 'package:rentpal/core/error/faliure.dart';
import 'package:rentpal/core/usecases/usecases.dart';
import 'package:rentpal/features/my_listing/domain/entity/my_listing_entity.dart';
import 'package:rentpal/features/my_listing/domain/repository/my_listing_repository.dart';

class GetListing extends UseCase<Either<Failure,List<MyListingEntity>>,void>{
  final MyListingRepository _repository;
  GetListing(this._repository);
  
  @override
  Future<Either<Failure, List<MyListingEntity>>> call({void params})async {
    return await _repository.getListings();
  }}