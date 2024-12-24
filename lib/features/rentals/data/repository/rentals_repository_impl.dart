import 'dart:convert';
import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:rentpal/core/error/faliure.dart';
import 'package:rentpal/features/rentals/data/datasource/remote/rentals_api_service.dart';
import 'package:rentpal/features/rentals/domain/entity/rentals_entity.dart';
import 'package:rentpal/features/rentals/domain/repository/rentals_repository.dart';
import 'package:rentpal/features/rentals/domain/usecase/update_rentals.dart';

class RentalsRepositoryImpl extends RentalsRepository {
  final RentalsApiService _apiService;
  RentalsRepositoryImpl(this._apiService);
  @override
  Future<Either<Failure, List<RentalsEntity>>> getRentals() async {
    try {
      final result = await _apiService.getRentals();
      if (result.statusCode == 200) {
        final jsonList = jsonDecode(result.body) as List;
        final rentals = jsonList.map((e) => RentalsEntity.fromJson(e)).toList();
        return right(rentals);
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
  Future<Either<Failure, void>> updateRentals(UpdateRentalsPrams params) async {
    try {
      final result = await _apiService.updateRentals(params.id, params.status);
      if (result.statusCode == 200) {
        return right(null);
      }
      if (result.statusCode == 500) {
        return left(const ServerFailure("Status update failed"));
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
