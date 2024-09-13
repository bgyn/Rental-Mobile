import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rentpal/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:rentpal/features/home/presentation/pages/home.dart';
import 'package:rentpal/features/add_listing/presentation/pages/add_new_listing.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final routeConfig = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/',
    routes: <RouteBase>[
      GoRoute(
        path: "/",
        builder: (context, state) => const Home(),
      ),
      GoRoute(
        path: "/add_listing/add_new_listing",
        builder: (context, state) => const AddNewListing(),
      ),
    ],
    redirect: (context, state) {
      final authState = context.watch<AuthCubit>().state;
      if (authState.isLoggedIn == true) {
        return '/';
      } else {
        return null;
      }
    });
