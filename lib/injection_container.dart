import 'package:get_it/get_it.dart';
import 'package:rentpal/features/add_listing/data/data_source/remote/add_listing_api_service.dart';
import 'package:rentpal/features/add_listing/data/repository/add_listing_respository_impl.dart';
import 'package:rentpal/features/add_listing/domain/repository/add_listing_repository.dart';
import 'package:rentpal/features/add_listing/domain/usecase/publish_listing.dart';
import 'package:rentpal/features/auth/domain/repository/auth_repository.dart';
import 'package:rentpal/features/auth/domain/usecase/current_user.dart';
import 'package:rentpal/features/auth/domain/usecase/user_login.dart';
import 'package:rentpal/features/auth/domain/usecase/user_sign_up.dart';
import 'package:rentpal/features/auth/presentation/bloc/auth_bloc.dart';
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

  //auth
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  sl.registerSingleton<UserLogin>(UserLogin(authRepository: sl()));
  sl.registerSingleton<UserSignUp>(UserSignUp(authRepository: sl()));
  sl.registerSingleton<CurrentUser>(CurrentUser(sl()));

  sl.registerLazySingleton(
    () => AuthBloc(
      userSignUp: sl(),
      userLogin: sl(),
      currentUser: sl(),
    ),
  );

  //add listing
  sl.registerSingleton<AddListingApiService>(AddListingApiService());
  sl.registerSingleton<AddListingRepository>(AddListingRespositoryImpl(sl()));
  sl.registerSingleton(PublishListing(sl()));
}
