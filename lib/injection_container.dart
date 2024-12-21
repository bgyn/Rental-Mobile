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
import 'package:rentpal/features/favourite/data/datasource/localsource/favourite_local_api_service.dart';
import 'package:rentpal/features/favourite/data/repository/favourite_repository_impl.dart';
import 'package:rentpal/features/favourite/domain/repository/favourite_repository.dart';
import 'package:rentpal/features/favourite/domain/usecase/add_favourite.dart';
import 'package:rentpal/features/favourite/domain/usecase/clear_favourite.dart';
import 'package:rentpal/features/favourite/domain/usecase/get_favourite.dart';
import 'package:rentpal/features/favourite/domain/usecase/is_favourite.dart';
import 'package:rentpal/features/favourite/domain/usecase/remove_favourite.dart';
import 'package:rentpal/features/my_listing/data/datasource/remote/my_listing_api_service.dart';
import 'package:rentpal/features/my_listing/data/repository/my_listing_repository_impl.dart';
import 'package:rentpal/features/my_listing/domain/repository/my_listing_repository.dart';
import 'package:rentpal/features/my_listing/domain/usercase/get_listing.dart';
import 'package:rentpal/features/profile/data/repository/profile_repository_impl.dart';
import 'package:rentpal/features/profile/data/source/remotesource/profile_api_service.dart';
import 'package:rentpal/features/profile/domain/repository/profile_repository.dart';
import 'package:rentpal/features/profile/domain/usecase/get_profile.dart';
import 'package:rentpal/features/profile/domain/usecase/update_profile.dart';
import 'package:rentpal/features/rentitem/data/datasource/remote/rentitem_api_service.dart';
import 'package:rentpal/features/rentitem/data/repository/rentitem_repository_impl.dart';
import 'package:rentpal/features/rentitem/domain/repository/rentitem_repository.dart';
import 'package:rentpal/features/rentitem/domain/usercase/get_rentitem.dart';
import 'package:rentpal/features/search/data/datasource/remote/search_api_service.dart';
import 'package:rentpal/features/search/data/repository/search_repository_impl.dart';
import 'package:rentpal/features/search/domain/repository/search_repository.dart';
import 'package:rentpal/features/search/domain/usecase/search.dart';
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
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl(sl(), sl()));

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

  //profile
  sl.registerSingleton<ProfileApiService>(ProfileApiService());
  sl.registerSingleton<ProfileRepository>(ProfileRepositoryImpl(sl()));
  sl.registerSingleton<UpdateProfile>(UpdateProfile(sl()));
  sl.registerSingleton<GetProfile>(GetProfile(sl()));

  //mylisting
  sl.registerSingleton<MyListingApiService>(MyListingApiService());
  sl.registerSingleton<MyListingRepository>(MyListingRepositoryImpl(sl()));
  sl.registerSingleton<GetListing>(GetListing(sl()));

  //favourite
  sl.registerSingleton<FavouirteLocalApiService>(FavouirteLocalApiService());
  sl.registerSingleton<FavouriteRepository>(
      FavouriteRepositoryImpl(favouriteLocalDataSource: sl()));
  sl.registerSingleton<AddFavourite>(AddFavourite(sl()));
  sl.registerSingleton<RemoveFavourite>(RemoveFavourite(sl()));
  sl.registerSingleton<IsFavourite>(IsFavourite(sl()));
  sl.registerSingleton<ClearFavourite>(ClearFavourite(sl()));
  sl.registerSingleton<GetFavourite>(GetFavourite(sl()));

  //search
  sl.registerSingleton<SearchApiService>(SearchApiService());
  sl.registerSingleton<SearchRepository>(SearchRepositoryImpl(sl()));
  sl.registerSingleton<Search>(Search(sl()));
}
