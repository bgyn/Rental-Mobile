import 'package:fpdart/fpdart.dart';
import 'package:rentpal/core/error/faliure.dart';
import 'package:rentpal/features/categories/domain/entities/category_entity.dart';

abstract class CategoryListRepository {
  Future<Either<Failure, List<CategoryEntity>>> getCategoryList();
  // Future<List<CategoryListEntity>> getCategoryList();
}
