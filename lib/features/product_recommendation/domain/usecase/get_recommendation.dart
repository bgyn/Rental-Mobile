import 'package:fpdart/fpdart.dart';
import 'package:rentpal/core/error/faliure.dart';
import 'package:rentpal/core/usecases/usecases.dart';
import 'package:rentpal/features/product_recommendation/domain/repository/product_recommendation_repo.dart';
import 'package:rentpal/features/rentitem/domain/entity/rentitem_entity.dart';

class GetRecommendation
    extends UseCase<Either<Failure, List<RentitemEntity>>, void> {
  final ProductRecommendationRepo _productRepo;

  GetRecommendation(this._productRepo);
  @override
  Future<Either<Failure, List<RentitemEntity>>> call({void params}) async {
    return await _productRepo.getRecommendation();
  }
}
