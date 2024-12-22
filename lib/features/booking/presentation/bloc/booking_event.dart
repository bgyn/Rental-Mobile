sealed class BookingEvent {
}

class BookRenItem extends BookingEvent{
  final String rentItemId;
  final DateTime startDate;
  final DateTime endDate;
  final int userId;

  BookRenItem(this.rentItemId, this.startDate, this.endDate, this.userId);
}