import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentpal/features/my_listing/presentation/bloc/listing_event.dart';
import 'package:rentpal/features/my_listing/presentation/bloc/listing_state.dart';

import '../../domain/usercase/get_listing.dart';

class ListingBloc extends Bloc<ListingEvent, ListingState> {
  final GetListing _getListing;

  ListingBloc({required GetListing getListing})
      : _getListing = getListing,
        super(ListingLoading()) {
    on<ListingFetch>(_onListingFetch);
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
}
