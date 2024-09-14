import 'package:get_it/get_it.dart';
import 'package:rentpal/features/categories/data/data_source/remote/category_api_service.dart';
import 'package:rentpal/features/categories/data/repository/category_list_repository_impl.dart';
import 'package:rentpal/features/categories/domain/repository/category_list_repository.dart';
import 'package:rentpal/features/categories/domain/usercases/get_category_list.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  //category api service
  sl.registerSingleton<CategoryApiService>(CategoryApiService());

  //category list repository
  sl.registerSingleton<CategoryListRepository>(
      CategoryListRepositoryImpl(sl()));

  //usercase
  sl.registerSingleton<GetCategoryList>(GetCategoryList(sl()));
}
