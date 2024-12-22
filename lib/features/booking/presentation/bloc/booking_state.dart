sealed class BookingState {

}


class BookingInitial extends BookingState {
  BookingInitial();
}

class BookingLoading extends BookingState {
  BookingLoading();
}

class BookingSuccess extends BookingState {
  BookingSuccess();
}

class BookingError extends BookingState {
  final String message;

  BookingError(this.message);
}