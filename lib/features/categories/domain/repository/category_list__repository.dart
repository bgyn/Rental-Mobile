import 'package:fpdart/fpdart.dart';
import 'package:rentpal/core/error/faliure.dart';
import 'package:rentpal/features/categories/domain/entities/categories_list.dart';

abstract class CategoryListRepository {
  Future<Either<Failure, List<CategoryListEntity>>> getCategoryList();
  // Future<List<CategoryListEntity>> getCategoryList();
}
