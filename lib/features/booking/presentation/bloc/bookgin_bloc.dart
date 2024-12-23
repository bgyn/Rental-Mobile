import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentpal/core/common/show_snackbar.dart';
import 'package:rentpal/features/booking/domain/usecase/book_rentItem.dart';
import 'package:rentpal/features/booking/presentation/bloc/booking_event.dart';
import 'package:rentpal/features/booking/presentation/bloc/booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  final BookRentitem bookRentitem;
  BookingBloc(this.bookRentitem) : super(BookingInitial()) {
    on<BookRenItem>(_onBookRentitem);
  }

  void _onBookRentitem(BookRenItem event, Emitter<BookingState> emit) async {
    emit(BookingLoading());
    final result = await bookRentitem.call(
        params: BookingParmas(
            rentItemId: event.rentItemId,
            startDate: event.startDate,
            endDate: event.endDate,));
    result.fold(
      (l) {
        showSnackbar(l.errorMessage);
        emit(BookingError(l.errorMessage));
      },
      (r) {
        showSnackbar('Product booked!');
        emit(BookingSuccess());
      },
    );
  }
}
