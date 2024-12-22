import 'package:fpdart/fpdart.dart';
import 'package:rentpal/core/error/faliure.dart';
import 'package:rentpal/core/usecases/usecases.dart';
import 'package:rentpal/features/booking/domain/repository/booking_repository.dart';

class BookRentitem extends UseCase<Either<Failure, void>, BookingParmas> {
  final BookingRepository _repository;

  BookRentitem(this._repository);

  @override
  Future<Either<Failure, void>> call({BookingParmas? params}) async {
    return await _repository.bookRentItem(
        params!.rentItemId, params.startDate, params.endDate, params.userId);
  }
}

class BookingParmas {
  final int rentItemId;
  final String startDate;
  final String endDate;
  final int userId;

  BookingParmas(
      {required this.rentItemId,
      required this.startDate,
      required this.endDate,
      required this.userId});
}
