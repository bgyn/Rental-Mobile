import 'package:fpdart/fpdart.dart';
import 'package:rentpal/core/error/faliure.dart';

abstract class BookingRepository {
  Future<Either<Failure,void>> bookRentItem(String rentItemIdd, DateTime startDate, DateTime endDate,int userId);
  Future<Either<Failure,void>> cancelBooking(String rentItemId);
}