import 'package:fpdart/fpdart.dart';
import 'package:rentpal/core/error/faliure.dart';
import 'package:rentpal/features/rentitem/domain/entity/rentitem_entity.dart';

abstract class FavouriteRepository {
  Future<Either<Failure,bool>> addFavourite(RentitemEntity item);

  Future<Either<Failure,bool>> removeFavourite(int id);

  Future<Either<Failure,bool>> isFavourite(int id);

  Future<Either<Failure,List<RentitemEntity>>> getFavourites();

  Future<void> clearFavourites();
}
