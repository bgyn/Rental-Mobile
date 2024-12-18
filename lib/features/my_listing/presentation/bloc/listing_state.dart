import 'package:rentpal/features/my_listing/domain/entity/my_listing_entity.dart';

sealed class ListingState {
  final String? error;
  final List<MyListingEntity>? listings;
  ListingState({this.error,this.listings});
}

class ListingLoading extends ListingState {}

class ListingSuccess extends ListingState {
  final List<MyListingEntity> data;
  ListingSuccess({required this.data}) : super(listings: data);
}

class ListingError extends ListingState {
  final String err;
  ListingError({required this.err}) : super(error: err);
}
