import 'package:rentpal/features/rentitem/domain/entity/rentitem_entity.dart';

sealed class FavouriteState {
  const FavouriteState();
}

class FavouriteInitial extends FavouriteState {
  const FavouriteInitial();
}

class FavouriteLoading extends FavouriteState {
  const FavouriteLoading();
}

class FavouriteLoaded extends FavouriteState {
  final List<RentitemEntity> rentitems;
  const FavouriteLoaded(this.rentitems);
}

class FavouriteError extends FavouriteState {
  final String message;
  const FavouriteError(this.message);
}








