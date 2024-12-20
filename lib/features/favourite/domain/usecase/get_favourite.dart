import 'package:fpdart/fpdart.dart';
import 'package:rentpal/core/error/faliure.dart';
import 'package:rentpal/core/usecases/usecases.dart';
import 'package:rentpal/features/favourite/domain/repository/favourite_repository.dart';
import 'package:rentpal/features/rentitem/domain/entity/rentitem_entity.dart';

class GetFavourite
    extends UseCase<Either<Failure, List<RentitemEntity>>, void> {
  final FavouriteRepository _repository;

  GetFavourite(this._repository);

  @override
  Future<Either<Failure, List<RentitemEntity>>> call({void params}) async {
    return await _repository.getFavourites();
  }
}
