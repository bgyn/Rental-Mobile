abstract class AddressEvent {}

class SearchAddress extends AddressEvent {
  final String query;
  SearchAddress({required this.query});
}
