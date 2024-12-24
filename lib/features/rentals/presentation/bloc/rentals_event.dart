sealed class RentalsEvent {}

class FetchRentals extends RentalsEvent {}

class UpdateRentals extends RentalsEvent {
  final int id;
  final String status;
  UpdateRentals(this.id, this.status);
}
