import 'package:fpdart/fpdart.dart';
import 'package:rentpal/core/error/faliure.dart';
import 'package:rentpal/core/usecases/usecases.dart';
import 'package:rentpal/features/categories/domain/entities/category_entity.dart';
import 'package:rentpal/features/categories/domain/repository/category_list_repository.dart';

class GetCategoryList
    implements UseCase<Either<Failure, List<CategoryEntity>>, void> {
  final CategoryListRepository _categoryListRepository;
  GetCategoryList(
    this._categoryListRepository,
  );

  @override
  Future<Either<Failure, List<CategoryEntity>>> call({void params}) async {
    return await _categoryListRepository.getCategoryList();
  }
}
