import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:rentpal/core/error/faliure.dart';
import 'package:rentpal/features/booking/data/datasource/remote/booking_api_service.dart';
import 'package:rentpal/features/booking/domain/repository/booking_repository.dart';

class BookingRepositoryImpl extends BookingRepository {
  final BookingApiService _apiService;

  BookingRepositoryImpl(this._apiService);

  @override
  Future<Either<Failure, void>> bookRentItem(
      int rentItemIdd, String startDate, String endDate) async {
    try {
      final result = await _apiService.bookRentItem(
          rentItemIdd, startDate, endDate);
      if (result.statusCode == 200 || result.statusCode == 201) {
        return right(null);
      }
      return left(const ServerFailure("Booking Failed"));
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

  @override
  Future<Either<Failure, void>> cancelBooking(String rentItemId) {
    throw UnimplementedError();
  }
}
