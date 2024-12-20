import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentpal/core/common/show_snackbar.dart';
import 'package:rentpal/features/favourite/domain/usecase/add_favourite.dart';
import 'package:rentpal/features/favourite/domain/usecase/clear_favourite.dart';
import 'package:rentpal/features/favourite/domain/usecase/get_favourite.dart';
import 'package:rentpal/features/favourite/domain/usecase/is_favourite.dart';
import 'package:rentpal/features/favourite/domain/usecase/remove_favourite.dart';
import 'package:rentpal/features/favourite/presentation/bloc/favourite_event.dart';
import 'package:rentpal/features/favourite/presentation/bloc/favourite_state.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  final AddFavourite addFavourite;
  final GetFavourite getFavourite;
  final IsFavourite isFavourite;
  final RemoveFavourite removeFavourite;
  final ClearFavourite favouriteClear;
  FavouriteBloc({
    required this.addFavourite,
    required this.getFavourite,
    required this.isFavourite,
    required this.removeFavourite,
    required this.favouriteClear,
  }) : super(const FavouriteInitial()) {
    on<FavouriteLoad>(_onFavouriteLoad);
    on<FavouriteAdd>(_onFavouriteAdd);
    on<FavouriteRemove>(_onFavouriteRemove);
    on<FavouriteCheck>(_onFavouriteCheck);
    on<FavouriteClear>(_onFavouriteClear);
  }

  void _onFavouriteLoad(
      FavouriteLoad event, Emitter<FavouriteState> emit) async {
    emit(const FavouriteLoading());
    final result = await getFavourite.call();
    result.fold(
      (failure) => emit(FavouriteError(failure.errorMessage)),
      (items) => emit(FavouriteLoaded(items)),
    );
  }

  void _onFavouriteAdd(FavouriteAdd event, Emitter<FavouriteState> emit) async {
    if (state is FavouriteLoaded) {
      final currentState = state as FavouriteLoaded;
      final updatedItems = List.of(currentState.rentitems);

      final result = await addFavourite.call(params: event.item);
      result.fold(
        (failure) => emit(FavouriteError(failure.errorMessage)),
        (_) {
          updatedItems.add(event.item);
          emit(FavouriteLoaded(updatedItems));
          showSnackbar("Added to favourite");
        },
      );
    }
  }

  void _onFavouriteRemove(
      FavouriteRemove event, Emitter<FavouriteState> emit) async {
    if (state is FavouriteLoaded) {
      final currentState = state as FavouriteLoaded;
      final updatedItems = List.of(currentState.rentitems);

      final result = await removeFavourite.call(params: event.rentitemId);
      result.fold(
        (failure) => emit(FavouriteError(failure.errorMessage)),
        (_) {
          updatedItems.removeWhere((item) => item.id == event.rentitemId);
          emit(FavouriteLoaded(updatedItems));
          showSnackbar("Removed from favourite");
        },
      );
    }
  }

  void _onFavouriteCheck(
      FavouriteCheck event, Emitter<FavouriteState> emit) async {
    final result = await isFavourite.call(params: event.rentitemId);
    result.fold(
      (failure) => emit(FavouriteError(failure.errorMessage)),
      (isFavourite) =>
          isFavourite ? _onFavouriteLoad(const FavouriteLoad(), emit) : null,
    );
  }

  void _onFavouriteClear(
      FavouriteClear event, Emitter<FavouriteState> emit) async {
    emit(const FavouriteLoading());
    await favouriteClear.call();
    emit(const FavouriteInitial());
  }
}
