import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentpal/core/common/show_snackbar.dart';
import 'package:rentpal/features/my_listing/domain/usercase/delete_listing.dart';
import 'package:rentpal/features/my_listing/presentation/bloc/listing_event.dart';
import 'package:rentpal/features/my_listing/presentation/bloc/listing_state.dart';

import '../../domain/usercase/get_listing.dart';

class ListingBloc extends Bloc<ListingEvent, ListingState> {
  final GetListing _getListing;
  final DeleteListing _deleteListing;

  ListingBloc(
      {required GetListing getListing, required DeleteListing deleteListing})
      : _getListing = getListing,
        _deleteListing = deleteListing,
        super(ListingLoading()) {
    on<ListingFetch>(_onListingFetch);
    on<ListingDelete>(_onListingDelete);
  }

  void _onListingFetch(ListingFetch event, Emitter<ListingState> emit) async {
    final data = await _getListing.call();
    data.fold(
      (l) => emit(ListingError(err: l.errorMessage)),
      (r) => emit(
        ListingSuccess(data: r),
      ),
    );
  }

  void _onListingDelete(ListingDelete event, Emitter<ListingState> emit) async {
    final data = await _deleteListing.call(params: event.id);
    data.fold(
      (l) {
        showSnackbar(l.errorMessage);
      },
      (r) {
        showSnackbar("Listing deleted successfully");
        _onListingFetch(ListingFetch(), emit);
      },
    );
  }
}
