import 'dart:convert';
import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:rentpal/core/error/faliure.dart';
import 'package:rentpal/features/product_recommendation/data/datasource/remote/product_recommendation_api_service.dart';
import 'package:rentpal/features/product_recommendation/domain/repository/product_recommendation_repo.dart';
import 'package:rentpal/features/rentitem/domain/entity/rentitem_entity.dart';

class ProducutRecommendatinoRepoImpl extends ProductRecommendationRepo {
  final ProductRecommendationApiService _apiService;

  ProducutRecommendatinoRepoImpl(this._apiService);
  @override
  Future<Either<Failure, List<RentitemEntity>>> getRecommendation() async {
    try {
      final result = await _apiService.getRecommendation();
      if (result.statusCode == 200) {
        final res = jsonDecode(result.body);
        final List<RentitemEntity> rentItems = (res["rent_items"] as List)
            .map((e) => RentitemEntity.fromJson(e as Map<String, dynamic>))
            .toList();
        return right(rentItems);
      } else {
        return left(const ServerFailure("Failed to get recommendation"));
      }
    } on SocketException {
      return left(const ConnectionFailure("No internet connection"));
    } on HttpException {
      return left(const ServerFailure("Couldn't find the resource"));
    } on FormatException {
      return left(const ServerFailure("Bad response format"));
    } catch (e) {
      return left(ServerFailure("$e"));
    }
  }
}
