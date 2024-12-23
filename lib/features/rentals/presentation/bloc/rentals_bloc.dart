import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentpal/core/common/show_snackbar.dart';
import 'package:rentpal/features/rentals/domain/usecase/get_rentals.dart';
import 'package:rentpal/features/rentals/domain/usecase/update_rentals.dart'
    as update;
import 'package:rentpal/features/rentals/presentation/bloc/rentals_event.dart';
import 'package:rentpal/features/rentals/presentation/bloc/rentals_state.dart';

class RentalsBloc extends Bloc<RentalsEvent, RentalsState> {
  final GetRentals _getRentals;
  final update.UpdateRentals _updateRentals;
  RentalsBloc(this._getRentals, this._updateRentals) : super(RentalsInitial()) {
    on<FetchRentals>(_onFetchRentals);
    on<UpdateRentals>(_onUpdateRentals);
  }

  void _onFetchRentals(FetchRentals event, Emitter<RentalsState> emit) async {
    emit(RentalsLoading());
    final result = await _getRentals.call();
    result.fold((l) {
      showSnackbar(l.errorMessage);
      emit(RentalsError(errMessage: l.errorMessage));
    }, (r) {
      emit(RentalsLoaded(rentals: r));
    });
  }

  void _onUpdateRentals(UpdateRentals event, Emitter<RentalsState> emit) async {
    emit(RentalsLoading());
    final result = await _updateRentals.call(params: event.id);
    result.fold(
      (l) {
        showSnackbar(l.errorMessage);
        emit(RentalsError(errMessage: l.errorMessage));
      },
      (r) {
        showSnackbar("Status updated successfully");
        _onFetchRentals(FetchRentals(), emit);
      },
    );
  }
}
