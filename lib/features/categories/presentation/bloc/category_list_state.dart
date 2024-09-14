import 'package:rentpal/features/categories/domain/entities/category_entity.dart';

abstract class CategoryListState {
  final List<CategoryEntity>? categoryList;

  CategoryListState({
    this.categoryList,
  });
}

class CategoryListLoading extends CategoryListState {}

class CategoryListSuccessful extends CategoryListState {
  final List<CategoryEntity> data;
  CategoryListSuccessful({required this.data}) : super(categoryList: data);
}
