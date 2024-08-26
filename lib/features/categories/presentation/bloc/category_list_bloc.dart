import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentpal/features/categories/domain/usercases/get_category_list.dart';
import 'package:rentpal/features/categories/presentation/bloc/category_list_event.dart';
import 'package:rentpal/features/categories/presentation/bloc/category_list_state.dart';

class CategoryListBloc extends Bloc<CategoryListEvent, CategoryListState> {
  final GetCategoryList _getCategoryList;

  CategoryListBloc(this._getCategoryList) : super(CategoryListLoading()) {
    on<FetchCategoryList>(_onGetCategoryList);
  }

  void _onGetCategoryList(
      FetchCategoryList evevnt, Emitter<CategoryListState> emit) async {
    final data = await _getCategoryList.call();
    emit(CategoryListSuccessful(data: data));
  }
}
