import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:rentpal/core/common/entities/api_success.dart';
import 'package:rentpal/core/error/faliure.dart';

abstract class AddListingRepository {
  Future<Either<Failure, ApiResponse>> publishListing({
    required String title,
    required double price,
    File? file,
    required String description,
    required int quantity,
    required double rating,
    required int noOfReviews,
    required String address,
    required String latitude,
    required String longitude,
    required List<String> itemRules,
    required String category,
  });
  Future<Either<Failure, ApiResponse>> updateListing({
    required String title,
    required double price,
    File? file,
    required String description,
    required int quantity,
    required double rating,
    required int noOfReviews,
    required String address,
    required String latitude,
    required String longitude,
    required List<String> itemRules,
    required String category,
  });
}
