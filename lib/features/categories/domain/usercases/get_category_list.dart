
import 'package:rentpal/core/usecases/usecases.dart';
import 'package:rentpal/features/categories/domain/entities/categories_list.dart';
import 'package:rentpal/features/categories/domain/repository/category_list__repository.dart';

class GetCategoryList implements UseCase<List<CategoryListEntity>, void> {
  final CategoryListRepository _categoryListRepository;
  GetCategoryList(
    this._categoryListRepository,
  );

  @override
  Future<List<CategoryListEntity>> call({void params}) async {
    return await _categoryListRepository.getCategoryList();
  }
}
