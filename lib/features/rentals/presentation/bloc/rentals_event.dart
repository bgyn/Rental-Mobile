sealed class RentalsEvent {}

class FetchRentals extends RentalsEvent {}

class UpdateRentals extends RentalsEvent {
  final int id;

  UpdateRentals(this.id);
}
