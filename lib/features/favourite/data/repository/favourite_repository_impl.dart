import 'package:fpdart/fpdart.dart';
import 'package:rentpal/core/error/faliure.dart';
import 'package:rentpal/features/favourite/data/datasource/localsource/favourite_local_api_service.dart';
import 'package:rentpal/features/favourite/domain/repository/favourite_repository.dart';
import 'package:rentpal/features/rentitem/domain/entity/rentitem_entity.dart';

class FavouriteRepositoryImpl implements FavouriteRepository {
  final FavouirteLocalApiService favouriteLocalDataSource;

  FavouriteRepositoryImpl({required this.favouriteLocalDataSource});

  @override
  Future<Either<Failure, bool>> addFavourite(RentitemEntity item) async {
    try {
      final resullt = await favouriteLocalDataSource.addFavorite(item);
      if (resullt) {
        return right(true);
      } else {
        return left(const StorageFailure("Failed to add to favourite"));
      }
    } catch (e) {
      return left(const StorageFailure("Failed to add to favourite"));
    }
  }

  @override
  Future<Either<Failure, List<RentitemEntity>>> getFavourites() async {
    final result = await favouriteLocalDataSource.getFavorites();
    return right(result);
  }

  @override
  Future<Either<Failure, bool>> isFavourite(int id) async {
    final result = await favouriteLocalDataSource.isFavorite(id);
    if (result) {
      return right(true);
    } else {
      return left(const StorageFailure("Failed to get favourite"));
    }
  }

  @override
  Future<Either<Failure, bool>> removeFavourite(int id) async {
    try {
      final resullt = await favouriteLocalDataSource.removeFavorite(id);
      if (resullt) {
        return right(true);
      } else {
        return left(const StorageFailure("Failed to remove from favourite"));
      }
    } catch (e) {
      return left(const StorageFailure("Failed to remove from favourite"));
    }
  }

  @override
  Future<void> clearFavourites() async {
    await favouriteLocalDataSource.clearFavorites();
  }
}
