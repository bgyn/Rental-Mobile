import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rentpal/features/add_listing/presentation/pages/add_listing_page.dart';
import 'package:rentpal/features/auth/presentation/pages/login_page.dart';
import 'package:rentpal/features/auth/presentation/pages/register_page.dart';
import 'package:rentpal/features/home/dummy_model.dart';
import 'package:rentpal/features/home/presentation/pages/dashboard_page.dart';
import 'package:rentpal/features/home/presentation/pages/home.dart';
import 'package:rentpal/features/home/presentation/pages/product_detail.dart';
import 'package:rentpal/features/menu/presentation/pages/menu_page.dart';
import 'package:rentpal/features/add_listing/presentation/pages/add_new_listing.dart';
import 'package:rentpal/features/my_listing/presentation/pages/my_listing_page.dart';
import 'package:rentpal/features/rentals/presentation/pages/rental_page.dart';
import 'package:rentpal/features/splash/presentation/splash_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final routeConfig = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/splash',
  routes: <RouteBase>[
    GoRoute(
      path: "/splash",
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: "/add_listing/add_new_listing",
      builder: (context, state) => const AddNewListing(),
    ),
    GoRoute(
      path: "/signin",
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: "/product-detail",
      builder: (context, state) {
        final product = state.extra as Product;
        return ProductDetail(product: product);
      },
    ),
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, stae, child) => Home(child: child),
      routes: [
        GoRoute(
          path: "/",
          builder: (context, state) => const DashboardPage(),
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
