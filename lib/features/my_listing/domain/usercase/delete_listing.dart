import 'package:fpdart/fpdart.dart';
import 'package:rentpal/core/error/faliure.dart';
import 'package:rentpal/core/usecases/usecases.dart';
import 'package:rentpal/features/my_listing/domain/repository/my_listing_repository.dart';

class DeleteListing extends UseCase<Either<Failure, void>, int> {
  final MyListingRepository repository;

  DeleteListing(this.repository);

  @override
  Future<Either<Failure, void>> call({int? params}) async {
    return repository.deleteListing(params!);
  }
}
