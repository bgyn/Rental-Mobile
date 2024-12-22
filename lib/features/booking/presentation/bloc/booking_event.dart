sealed class BookingEvent {}

class BookRenItem extends BookingEvent {
  final int rentItemId;
  final String startDate;
  final String endDate;
  final int userId;

  BookRenItem(this.rentItemId, this.startDate, this.endDate, this.userId);
}
