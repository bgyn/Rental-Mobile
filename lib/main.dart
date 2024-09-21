import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentpal/config/routes/route_config.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:rentpal/core/permission/permission_handler.dart';
import 'package:rentpal/features/add_listing/cubit/address_cubit.dart';
import 'package:rentpal/core/cubit/image_handler_cubit.dart';
import 'package:rentpal/features/add_listing/cubit/rules_cubit.dart';
import 'package:rentpal/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:rentpal/features/categories/presentation/bloc/category_list_bloc.dart';
import 'package:rentpal/features/categories/presentation/bloc/category_list_event.dart';
import 'package:rentpal/features/home/presentation/cubit/navigator_cubit.dart';
import 'package:rentpal/injection_container.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        BlocProvider(create: (_) => AuthCubit()),
        BlocProvider(create: (_) => NavigatorCubit()),
        BlocProvider(
            create: (_) =>
                CategoryListBloc(sl())..add(const FetchCategoryList()))
      ],
      child: MaterialApp.router(
        title: "Rentpal",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: Colors.white,
        ),
        // routerConfig: routeConfig,
        routerDelegate: routeConfig.routerDelegate,
        routeInformationParser: routeConfig.routeInformationParser,
        routeInformationProvider: routeConfig.routeInformationProvider,
      ),
    );
  }
}
