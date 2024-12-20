import 'package:rentpal/features/rentitem/domain/entity/rentitem_entity.dart';

sealed class FavouriteEvent {
  const FavouriteEvent();
}

class FavouriteLoad extends FavouriteEvent {
  const FavouriteLoad();
}

class FavouriteAdd extends FavouriteEvent {
  final RentitemEntity item;
  const FavouriteAdd(this.item);
}

class FavouriteRemove extends FavouriteEvent {
  final int rentitemId;
  const FavouriteRemove(this.rentitemId);
}

class FavouriteCheck extends FavouriteEvent {
  final int rentitemId;
  const FavouriteCheck(this.rentitemId);
}

class FavouriteFound extends FavouriteEvent {
  const FavouriteFound();
}

class FavouriteClear extends FavouriteEvent {
  const FavouriteClear();
}
