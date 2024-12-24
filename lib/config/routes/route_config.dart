import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rentpal/core/local_storage/local_storage.dart';
import 'package:rentpal/features/add_listing/presentation/pages/add_listing_page.dart';
import 'package:rentpal/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:rentpal/features/auth/presentation/pages/forgot_password_page.dart';
import 'package:rentpal/features/auth/presentation/pages/login_page.dart';
import 'package:rentpal/features/auth/presentation/pages/register_page.dart';
import 'package:rentpal/features/categories/domain/entities/category_entity.dart';
import 'package:rentpal/features/favourite/presentation/pages/favourite_pages.dart';
import 'package:rentpal/features/home/presentation/pages/dashboard_page.dart';
import 'package:rentpal/features/home/presentation/pages/home.dart';
import 'package:rentpal/features/home/presentation/pages/product_detail.dart';
import 'package:rentpal/features/menu/presentation/pages/menu_page.dart';
import 'package:rentpal/features/add_listing/presentation/pages/add_new_listing.dart';
import 'package:rentpal/features/my_listing/domain/entity/my_listing_entity.dart';
import 'package:rentpal/features/my_listing/presentation/pages/my_listing_page.dart';
import 'package:rentpal/features/my_orders/presentation/page/my_order_page.dart';
import 'package:rentpal/features/profile/presentation/pages/edit_profile_page.dart';
import 'package:rentpal/features/rentals/presentation/pages/rental_page.dart';
import 'package:rentpal/features/rentitem/domain/entity/rentitem_entity.dart';
import 'package:rentpal/features/rentitem/presentation/pages/rentpal_category_grid.dart';
import 'package:rentpal/features/splash/presentation/splash_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final routeConfig = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/splash',
  redirect: (context, state) async {
    final res = await LocalStorage.getProfile();
    if (!context.mounted) return null;
    final authState = context.read<AuthBloc>().state;
    if (state.fullPath == "/" && authState is AuthSuccess) {
      if (res == false) {
        return "/edit-profile/${"register"}";
      }
      return null;
    }
    return null;
  },
  routes: <RouteBase>[
    GoRoute(
      path: "/myorder",
      builder: (context, state) => const MyOrderPage(),
    ),
    GoRoute(
      path: "/splash",
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
        path: "/add_listing/add_new_listing",
        builder: (context, state) {
          return const AddNewListing();
        }),
    GoRoute(
        path: "/add_listing/add_new_listing/:title/:rentItem",
        builder: (context, state) {
          final title = state.pathParameters["title"];
          final rentItemJson = state.pathParameters["rentItem"];
          final rentItem = MyListingEntity.fromJson(
              jsonDecode(Uri.decodeComponent(rentItemJson!)));
          return AddNewListing(
            title: title,
            myListingEntity: rentItem,
          );
        }),
    GoRoute(
      path: "/signin",
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: "/forgot-password",
      builder: (context, state) => const ForgotPasswordPage(),
    ),
    GoRoute(
      path: "/product-detail",
      builder: (context, state) {
        final product = state.extra as RentitemEntity;
        return ProductDetail(rentitemEntity: product);
      },
    ),
    GoRoute(
      path: "/favourite",
      builder: (context, state) {
        return const FavouritePages();
      },
    ),
    GoRoute(
        path: "/category-product",
        builder: (context, state) {
          final categoryJson = state.extra as String;
          final category = CategoryEntity.fromJson(jsonDecode(categoryJson));
          return RentpalCategoryGrid(
            category: category,
          );
        }),
    GoRoute(
        path: "/edit-profile/:from",
        builder: (context, state) {
          // get the path parameter
          final from = state.pathParameters["from"];
          return EditProfilePage(
            from: from.toString(),
          );
        }),
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
          builder: (context, state) => const RentalPage(),
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
