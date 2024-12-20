import 'package:fpdart/fpdart.dart';
import 'package:rentpal/core/error/faliure.dart';
import 'package:rentpal/core/usecases/usecases.dart';
import 'package:rentpal/features/favourite/domain/repository/favourite_repository.dart';

class RemoveFavourite extends UseCase<Either<Failure, bool>, int> {
  final FavouriteRepository _repository;

  RemoveFavourite(this._repository);

  @override
  Future<Either<Failure, bool>> call({int? params}) async {
    return await _repository.removeFavourite(params!);
  }
}
