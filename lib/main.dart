import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:rentpal/config/routes/route_config.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:rentpal/config/theme/theme.dart';
import 'package:rentpal/core/common/show_snackbar.dart';
import 'package:rentpal/core/local_storage/local_storage.dart';
import 'package:rentpal/core/permission/permission_handler.dart';
import 'package:rentpal/core/cubit/image_handler_cubit.dart';
import 'package:rentpal/features/add_listing/cubit/rules_cubit.dart';
import 'package:rentpal/features/add_listing/presentation/bloc/add_listing_bloc.dart';
import 'package:rentpal/features/address/bloc/address_bloc.dart';
import 'package:rentpal/features/address/cubit/address_cubit.dart';
import 'package:rentpal/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:rentpal/features/booking/presentation/bloc/bookgin_bloc.dart';
import 'package:rentpal/features/categories/presentation/bloc/category_list_bloc.dart';
import 'package:rentpal/features/favourite/presentation/bloc/favourite_bloc.dart';
import 'package:rentpal/features/home/presentation/cubit/navigator_cubit.dart';
import 'package:rentpal/features/my_listing/presentation/bloc/listing_bloc.dart';
import 'package:rentpal/features/my_orders/presentation/bloc/my_order_bloc.dart';
import 'package:rentpal/features/product_recommendation/presentation/bloc/recommendation_bloc.dart';
import 'package:rentpal/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:rentpal/features/profile/presentation/bloc/profile_event.dart';
import 'package:rentpal/features/rentals/presentation/bloc/rentals_bloc.dart';
import 'package:rentpal/features/search/presentation/bloc/search_bloc.dart';
import 'package:rentpal/features/user/presentation/bloc/user_bloc.dart';
import 'package:rentpal/injection_container.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocalStorage();
  await initializeDependencies();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    PermissionHandler().getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Set the status bar color to white
      statusBarIconBrightness:
          Brightness.light, // Set icons to dark (visible on white background)
      statusBarBrightness: Brightness.light, // For iOS status bar
    ));
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AddressCubit()),
        BlocProvider(create: (_) => RulesCubit()),
        BlocProvider(create: (_) => ImageHandlerCubit()),
        BlocProvider(create: (_) => sl<AuthBloc>()..add(AuthIsUserLoggedIn())),
        BlocProvider(create: (_) => NavigatorCubit()),
        BlocProvider(create: (_) => AddListingBloc(sl(), sl())),
        BlocProvider(create: (_) => AddressBloc(sl())),
        BlocProvider(create: (_) => UserBloc(sl())),
        BlocProvider(create: (_) => SearchBloc(sl())),
        BlocProvider(create: (_) => BookingBloc(sl())),
        BlocProvider(create: (_) => MyOrderBloc(sl())),
        BlocProvider(create: (_) => RecommendationBloc(sl())),
        BlocProvider(create: (_) => RentalsBloc(sl(), sl())),
        BlocProvider(
            create: (_) => FavouriteBloc(
                addFavourite: sl(),
                getFavourite: sl(),
                isFavourite: sl(),
                favouriteClear: sl(),
                removeFavourite: sl())),
        BlocProvider(
            create: (_) => ProfileBloc(
                getProfile: sl(), updateProfile: sl(), getProfileById: sl())
              ..add(ProfileFetch())),
        BlocProvider(
            create: (_) => ListingBloc(getListing: sl(), deleteListing: sl())),
        BlocProvider(create: (_) => CategoryListBloc(sl()))
      ],
      child: MaterialApp.router(
        scaffoldMessengerKey: scaffoldMessengerKey,
        title: "Rentpal",
        debugShowCheckedModeBanner: false,
        theme: getAppTheme(context),
        // routerConfig: routeConfig,
        routerDelegate: routeConfig.routerDelegate,
        routeInformationParser: routeConfig.routeInformationParser,
        routeInformationProvider: routeConfig.routeInformationProvider,
      ),
    );
  }
}
