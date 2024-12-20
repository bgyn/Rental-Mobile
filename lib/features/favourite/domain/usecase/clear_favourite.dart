import 'package:rentpal/core/usecases/usecases.dart';
import 'package:rentpal/features/favourite/domain/repository/favourite_repository.dart';

class ClearFavourite extends UseCase<void, void> {
  final FavouriteRepository _repository;
  ClearFavourite(
    this._repository,
  );

  @override
  Future<void> call({void params}) async {
    return await _repository.clearFavourites();
  }
}
