import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:rentpal/core/error/faliure.dart';
import 'package:rentpal/features/rentals/data/datasource/remote/rentals_api_service.dart';
import 'package:rentpal/features/rentals/domain/entity/rentals_entity.dart';
import 'package:rentpal/features/rentals/domain/repository/rentals_repository.dart';

class RentalsRepositoryImpl extends RentalsRepository {
  final RentalsApiService _apiService;
  RentalsRepositoryImpl(this._apiService);
  @override
  Future<Either<Failure, List<RentalsEntity>>> getRentals() async {
    try {
      final result = await _apiService.getRentals();
      if (result.statusCode == 200) {
        return right([]);
      }
      return left(const ServerFailure("Failed to get rentals"));
    } on SocketException {
      return left(const ConnectionFailure("No internet connection"));
    } on HttpException {
      return left(const ServerFailure("Error fetching renitem"));
    } on FormatException {
      return left(const ServerFailure("Bad response format"));
    } catch (e) {
      return left(ServerFailure("$e"));
    }
  }

  @override
  Future<Either<Failure, void>> updateRentals(int id) async {
    try {
      final result = await _apiService.getRentals();
      if (result.statusCode == 200) {
        return right(null);
      }
      return left(const ServerFailure("Failed to update status"));
    } on SocketException {
      return left(const ConnectionFailure("No internet connection"));
    } on HttpException {
      return left(const ServerFailure("Error fetching renitem"));
    } on FormatException {
      return left(const ServerFailure("Bad response format"));
    } catch (e) {
      return left(ServerFailure("$e"));
    }
  }
}
