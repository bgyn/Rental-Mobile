import 'package:fpdart/fpdart.dart';
import 'package:rentpal/core/error/faliure.dart';
import 'package:rentpal/core/usecases/usecases.dart';
import 'package:rentpal/features/favourite/domain/repository/favourite_repository.dart';
import 'package:rentpal/features/rentitem/domain/entity/rentitem_entity.dart';

class AddFavourite extends UseCase<Either<Failure, bool>, RentitemEntity> {
  final FavouriteRepository _favouriteRepository;

  AddFavourite(this._favouriteRepository);

  @override
  Future<Either<Failure, bool>> call({RentitemEntity? params}) async {
    return await _favouriteRepository.addFavourite(params!);
  }
}
