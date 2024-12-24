import 'dart:convert';
import 'dart:io';

import 'package:fpdart/fpdart.dart';

import 'package:rentpal/core/error/faliure.dart';
import 'package:rentpal/features/my_listing/data/datasource/remote/my_listing_api_service.dart';
import 'package:rentpal/features/my_listing/domain/entity/my_listing_entity.dart';
import 'package:rentpal/features/my_listing/domain/repository/my_listing_repository.dart';

class MyListingRepositoryImpl extends MyListingRepository {
  final MyListingApiService _apiService;
  MyListingRepositoryImpl(
    this._apiService,
  );
  @override
  Future<Either<Failure, List<MyListingEntity>>> getListings() async {
    try {
      final response = await _apiService.getListings();
      final List jsonList = jsonDecode(response.body);
      final result = MyListingEntity.fromJsonList(jsonList);
      if (response.statusCode == 200) {
        return right(result);
      } else {
        return left(const ServerFailure("Error fetching rentitem"));
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
  Future<Either<Failure, void>> deleteListing(int id) async {
    try {
      final response = await _apiService.deleteListing(id);
      if (response.statusCode == 200 || response.statusCode == 204) {
        return right(null);
      } else {
        return left(const ServerFailure("Error deleting rentitem"));
      }
    } on SocketException {
      return left(const ServerFailure("No internet connection"));
    } on HttpException {
      return left(const ServerFailure("Eror deleting rentitem"));
    } on FormatException {
      return left(const ServerFailure("Bad response format"));
    } catch (e) {
      return left(ServerFailure("$e"));
    }
  }
}
