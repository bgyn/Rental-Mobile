import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:rentpal/core/common/entities/api_success.dart';
import 'package:rentpal/core/error/faliure.dart';
import 'package:rentpal/features/add_listing/data/data_source/remote/add_listing_api_service.dart';
import 'package:rentpal/features/add_listing/domain/repository/add_listing_repository.dart';

class AddListingRespositoryImpl implements AddListingRepository {
  final AddListingApiService _addListingApiService;
  AddListingRespositoryImpl(this._addListingApiService);

  @override
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
    required String itemRules,
    required String category,
  }) async {
    try {
      final body = {
        'title': title,
        'price': price,
        'description': description,
        'quantity': quantity,
        'rating': rating,
        'noOfReviews': noOfReviews,
        'address': address,
        'latitude': latitude,
        'longitude': longitude,
        'itemRules': itemRules,
        "category": category,
      };

      final response = await _addListingApiService.publishListing(body, file!);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return right(ApiSuccess(
          statusCode: response.statusCode,
          message: response.body,
        ));
      } else {
        return left(
            ServerFailure("Failed to publish listing: ${response.body}"));
      }
    } on SocketException {
      return left(const ServerFailure("No internet connection"));
    } on HttpException {
      return left(const ServerFailure("Couldn't find the resource"));
    } on FormatException {
      return left(const ServerFailure("Bad response format"));
    } catch (e) {
      return left(ServerFailure("$e"));
    }
  }

  @override
  Future<Either<Failure, ApiResponse>> updateListing(
      {required String title,
      required double price,
      File? file,
      required String description,
      required int quantity,
      required double rating,
      required int noOfReviews,
      required String address,
      required String latitude,
      required String longitude,
      required String itemRules,
      required String category,required int id}) async {
    try {
      final body = {
        'title': title,
        'price': price,
        'description': description,
        'quantity': quantity,
        'rating': rating,
        'noOfReviews': noOfReviews,
        'address': address,
        'latitude': latitude,
        'longitude': longitude,
        'itemRules': itemRules,
        "category": category,
      };

      final response = await _addListingApiService.updateListing(body, file,id);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return right(ApiSuccess(
          statusCode: response.statusCode,
          message: response.body,
        ));
      } else {
        return left(
            ServerFailure("Failed to publish listing: ${response.body}"));
      }
    } on SocketException {
      return left(const ServerFailure("No internet connection"));
    } on HttpException {
      return left(const ServerFailure("Couldn't find the resource"));
    } on FormatException {
      return left(const ServerFailure("Bad response format"));
    } catch (e) {
      return left(ServerFailure("$e"));
    }
  }
}
