import 'package:rentpal/features/categories/domain/entities/categories_list.dart';

abstract class CategoryListState {
  final List<CategoryListEntity>? categoryList;

  CategoryListState({
    this.categoryList,
  });
}

class CategoryListLoading extends CategoryListState {}

class CategoryListSuccessful extends CategoryListState {
  final List<CategoryListEntity> data;
  CategoryListSuccessful({required this.data}) : super(categoryList: data);
}
