import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentpal/features/add_listing/domain/usecase/publish_listing.dart';
import 'package:rentpal/features/add_listing/domain/usecase/update_listing.dart';

part 'add_listing_event.dart';
part 'add_listing_state.dart';

class AddListingBloc extends Bloc<AddListingEvent, AddListingState> {
  final PublishListing _publishListing;
  final UpdateListing _updateListing;

  AddListingBloc(this._publishListing, this._updateListing)
      : super(AddListingInitial()) {
    on<PublishProductListing>(_onPublishListing);
    on<UpdateProductListing>(_onUpdateListing);
  }

  _onPublishListing(
      PublishProductListing event, Emitter<AddListingState> emit) async {
    emit(AddListingLoading());
    final params = PublishListingParams(
      title: event.title,
      price: event.price,
      description: event.description,
      quantity: event.quantity,
      rating: event.rating,
      noOfReviews: event.noOfReviews,
      address: event.address,
      latitude: event.latitude,
      longitude: event.longitude,
      file: event.file,
      itemRules: event.itemRules,
      category: event.category,
    );

    final result = await _publishListing.call(params: params);

    result.fold(
      (failure) => emit(
          AddListingFailure(error: failure.errorMessage)), // Handle failure
      (success) => emit(AddListingSuccess(
          message: "Listing published successfully!")), // Handle success
    );
  }

  _onUpdateListing(
      UpdateProductListing event, Emitter<AddListingState> emit) async {
    emit(AddListingLoading());
    final params = PublishListingParams(
      id: event.id,
      title: event.title,
      price: event.price,
      description: event.description,
      quantity: event.quantity,
      rating: event.rating,
      noOfReviews: event.noOfReviews,
      address: event.address,
      latitude: event.latitude,
      longitude: event.longitude,
      file: event.file,
      itemRules: event.itemRules,
      category: event.category,
    );

    final result = await _updateListing.call(params: params);

    result.fold(
      (failure) => emit(
          AddListingFailure(error: failure.errorMessage)), // Handle failure
      (success) => emit(AddListingSuccess(
          message: "Listing updated successfully!")), // Handle success
    );
  }
}
