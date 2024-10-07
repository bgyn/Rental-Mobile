part of 'add_listing_bloc.dart';

@immutable
sealed class AddListingEvent {}

final class PublishProductListing extends AddListingEvent {
  final String title;
  final double price;
  final File? file;
  final String description;
  final int quantity;
  final double rating;
  final int noOfReviews;
  final String address;
  final String latitude;
  final String longitude;
  PublishProductListing({
    required this.title,
    required this.price,
    this.file,
    required this.description,
    required this.quantity,
    required this.rating,
    required this.noOfReviews,
    required this.address,
    required this.latitude,
    required this.longitude,
  });
}
