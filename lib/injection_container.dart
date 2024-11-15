import 'package:get_it/get_it.dart';
import 'package:rentpal/features/add_listing/data/data_source/remote/add_listing_api_service.dart';
import 'package:rentpal/features/add_listing/data/repository/add_listing_respository_impl.dart';
import 'package:rentpal/features/add_listing/domain/repository/add_listing_repository.dart';
import 'package:rentpal/features/add_listing/domain/usecase/publish_listing.dart';
import 'package:rentpal/features/address/data/datasource/remote/address_api_service.dart';
import 'package:rentpal/features/address/data/repository/address_respository_impl.dart';
import 'package:rentpal/features/address/domain/repository/address_repository.dart';
import 'package:rentpal/features/address/domain/usecases/get_address_list.dart';
import 'package:rentpal/features/auth/data/data_source/local/local_auth_api_service.dart';
import 'package:rentpal/features/auth/data/data_source/remote/auth_api_service.dart';
import 'package:rentpal/features/auth/data/repository/auth_repository_impl.dart';
import 'package:rentpal/features/auth/domain/repository/auth_repository.dart';
import 'package:rentpal/features/auth/domain/usecase/is_loggedin.dart';
import 'package:rentpal/features/auth/domain/usecase/user_login.dart';
import 'package:rentpal/features/auth/domain/usecase/user_sign_up.dart';
import 'package:rentpal/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:rentpal/features/categories/data/data_source/remote/category_api_service.dart';
import 'package:rentpal/features/categories/data/repository/category_list_repository_impl.dart';
import 'package:rentpal/features/categories/domain/repository/category_list_repository.dart';
import 'package:rentpal/features/categories/domain/usercases/get_category_list.dart';
import 'package:rentpal/features/rentitem/data/datasource/remote/rentitem_api_service.dart';
import 'package:rentpal/features/rentitem/data/repository/rentitem_repository_impl.dart';
import 'package:rentpal/features/rentitem/domain/repository/rentitem_repository.dart';
import 'package:rentpal/features/rentitem/domain/usercase/get_rentitem.dart';
import 'package:rentpal/features/user/data/datasource/user_api_service.dart';
import 'package:rentpal/features/user/data/repository/user_repository_impl.dart';
import 'package:rentpal/features/user/domain/repository/user_repository.dart';
import 'package:rentpal/features/user/domain/usecase/get_user_usecase.dart';

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
  sl.registerSingleton<AuthApiService>(AuthApiService());
  sl.registerSingleton<LocalAuthApiService>(LocalAuthApiService());
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl(sl(),sl()));

  sl.registerSingleton<UserLogin>(UserLogin(authRepository: sl()));
  sl.registerSingleton<UserSignUp>(UserSignUp(authRepository: sl()));
  sl.registerSingleton<IsLoggedIn>(IsLoggedIn(sl()));

  sl.registerLazySingleton(
    () => AuthBloc(
      userSignUp: sl(),
      userLogin: sl(),
      isLoggedIn: sl(),
    ),
  );

  //add listing
  sl.registerSingleton<AddListingApiService>(AddListingApiService());
  sl.registerSingleton<AddListingRepository>(AddListingRespositoryImpl(sl()));
  sl.registerSingleton(PublishListing(sl()));

  //rentlist
  sl.registerSingleton<RentitemApiService>(RentitemApiService());
  sl.registerSingleton<RentitemRepository>(RentitemRepositoryImpl(sl()));
  sl.registerSingleton<GetRentitem>(GetRentitem(sl()));

  //address
   sl.registerSingleton<AddressApiService>(AddressApiService());
   sl.registerSingleton<AddressRepository>(AddressRespositoryImpl(sl()));
   sl.registerSingleton<GetAddressList>(GetAddressList(sl()));

  //user
  sl.registerSingleton<UserApiService>(UserApiService());
  sl.registerSingleton<UserRepository>(UserRepositoryImpl(sl()));
  sl.registerSingleton<GetUser>(GetUser(sl()));

}
