part of 'add_listing_bloc.dart';

@immutable
sealed class AddListingState {}

final class AddListingInitial extends AddListingState {}

final class AddListingLoading extends AddListingState {}

final class AddListingSuccess extends AddListingState {
  final String message; 
  AddListingSuccess({required this.message});
}

final class AddListingFailure extends AddListingState {
  final String error;
  AddListingFailure({required this.error});
}
