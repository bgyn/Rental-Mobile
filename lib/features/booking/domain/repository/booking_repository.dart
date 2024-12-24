import 'package:fpdart/fpdart.dart';
import 'package:rentpal/core/error/faliure.dart';

abstract class BookingRepository {
  Future<Either<Failure, void>> bookRentItem(
      int rentItemIdd, String startDate, String endDate);
  Future<Either<Failure, void>> cancelBooking(String rentItemId);
}
