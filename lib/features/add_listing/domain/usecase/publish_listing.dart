import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:rentpal/core/common/entities/api_success.dart';

import 'package:rentpal/core/error/faliure.dart';
import 'package:rentpal/core/usecases/usecases.dart';
import 'package:rentpal/features/add_listing/domain/repository/add_listing_repository.dart';

class PublishListing
    implements UseCase<Either<Failure, ApiResponse>, PublishListingParams> {
  final AddListingRepository _addListingRepository;

  PublishListing(this._addListingRepository);
  @override
  Future<Either<Failure, ApiResponse>> call(
      {PublishListingParams? params}) async {
    return await _addListingRepository.publishListing(
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

class PublishListingParams {
  final String title;
  final double price;
  final File? file;
  final String description;
  final int quantity;
  final double rating;
  final int noOfReviews;
  final String address;
  final String latitude;
  final String longitude;
  final String itemRules;
  final String category;
  PublishListingParams({
    required this.title,
    required this.price,
    this.file,
    required this.description,
    required this.quantity,
    required this.rating,
    required this.noOfReviews,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.itemRules,
    required this.category,
  });
}
