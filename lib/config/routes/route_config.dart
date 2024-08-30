import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rentpal/features/add_listing/presentation/pages/add_listing_page.dart';
import 'package:rentpal/features/auth/presentation/pages/login_page.dart';
import 'package:rentpal/features/auth/presentation/pages/register_page.dart';
import 'package:rentpal/features/home/presentation/pages/home.dart';
import 'package:rentpal/features/home/presentation/pages/home_page.dart';
import 'package:rentpal/features/menu/presentation/pages/menu_page.dart';
import 'package:rentpal/features/my_listing/presentation/pages/my_listing_page.dart';
import 'package:rentpal/features/rentals/presentation/pages/rental_page.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final routeConfig = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: <RouteBase>[
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, stae, child) => Home(child: child),
      routes: [
        GoRoute(
          path: "/",
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          path: "/login",
          builder: (context, state) => const LoginPage(),
        ),
        GoRoute(
          path: "/register",
          builder: (context, state) => const RegisterPage(),
        ),
        GoRoute(
          path: "/rentals",
          builder: (context, state) => RentalPage(),
        ),
        GoRoute(
          path: "/add_listing",
          builder: (context, state) => const AddListingPage(),
        ),
        GoRoute(
          path: "/my_listing",
          builder: (context, state) => const MyListingPage(),
        ),
        GoRoute(
          path: "/menu",
          builder: (context, state) => const MenuPage(),
        ),
      ],
    )
  ],
);
