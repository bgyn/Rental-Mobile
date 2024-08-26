import 'package:rentpal/features/categories/domain/entities/categories_list.dart';

abstract class CategoryListRepository {
  Future<List<CategoryListEntity>> getCategoryList();
}
