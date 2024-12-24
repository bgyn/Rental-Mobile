import 'package:fpdart/fpdart.dart';
import 'package:rentpal/core/common/entities/api_success.dart';

import 'package:rentpal/core/error/faliure.dart';
import 'package:rentpal/core/usecases/usecases.dart';
import 'package:rentpal/features/add_listing/domain/repository/add_listing_repository.dart';
import 'package:rentpal/features/add_listing/domain/usecase/publish_listing.dart';

class UpdateListing
    implements UseCase<Either<Failure, ApiResponse>, PublishListingParams> {
  final AddListingRepository _addListingRepository;

  UpdateListing(this._addListingRepository);
  @override
  Future<Either<Failure, ApiResponse>> call(
      {PublishListingParams? params}) async {
    return await _addListingRepository.updateListing(
      file: params!.file,
      title: params.title,
      price: params.price,
      description: params.description,
      quantity: params.quantity,
      rating: params.rating,
      noOfReviews: params.noOfReviews,
      address: params.address,
      latitude: params.latitude,
      longitude: params.longitude,
      itemRules: params.itemRules,
      category: params.category,
    );
  }
}


