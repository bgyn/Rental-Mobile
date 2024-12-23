import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:rentpal/config/theme/color_palette.dart';
import 'package:rentpal/core/extension/extension.dart';
import 'package:rentpal/features/add_listing/presentation/pages/add_listing_page.dart';
import 'package:rentpal/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:rentpal/features/auth/presentation/pages/login_page.dart';
import 'package:rentpal/features/auth/presentation/pages/register_page.dart';
import 'package:rentpal/features/home/presentation/cubit/navigator_cubit.dart';
import 'package:rentpal/features/home/presentation/pages/dashboard_page.dart';
import 'package:rentpal/features/menu/presentation/pages/menu_page.dart';
import 'package:rentpal/features/my_listing/presentation/pages/my_listing_page.dart';
import 'package:rentpal/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:rentpal/features/profile/presentation/bloc/profile_event.dart';
import 'package:rentpal/features/rentals/presentation/pages/rental_page.dart';

class Home extends StatefulWidget {
  final Widget child;
  const Home({super.key, required this.child});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List loggedInRoute = [
    const DashboardPage(),
    RentalPage(),
    const AddListingPage(),
    const MyListingPage(),
    const MenuPage(),
  ];

  List loggedOutRoute = [
    const DashboardPage(),
    const LoginPage(),
    const RegisterPage(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = context.watch<NavigatorCubit>();
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, authState) {
        if (authState is RegisterSuccess) {
          context.read<NavigatorCubit>().reset();
          context.go('/edit-profile/${"register"}');
        } else if (authState is AuthSuccess) {
          context.read<ProfileBloc>().add(ProfileFetch());
          context.read<NavigatorCubit>().reset();
        } else if (authState is AuthFaliure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(authState.message)),
          );
        }
      },
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, authState) {
          return Stack(children: [
            Scaffold(
              body: authState is AuthSuccess
                  ? loggedInRoute[currentIndex.state]
                  : loggedOutRoute[currentIndex.state],
              bottomNavigationBar: GNav(
                backgroundColor: Colors.grey.shade200,
                curve: Curves.elasticIn,
                iconSize: 22,
                selectedIndex: currentIndex.state,
                onTabChange: context.read<NavigatorCubit>().onChanged,
                activeColor: ColorPalette.primaryColor,
                color: Colors.black,
                tabs: authState is AuthSuccess
                    ? const [
                        GButton(icon: Icons.home),
                        GButton(icon: Icons.message),
                        GButton(icon: Icons.add),
                        GButton(icon: Icons.list_alt_outlined),
                        GButton(icon: Icons.menu),
                      ]
                    : const [
                        GButton(icon: Icons.home),
                        GButton(icon: Icons.login),
                        GButton(icon: Icons.app_registration_rounded),
                      ],
              ),
            ),
            if (authState is AuthLoading)
              Center(
                child: Container(
                  width: 0.5.w(context),
                  height: 0.2.h(context),
                  decoration: BoxDecoration(
                    color: ColorPalette.primaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(
                      child: CircularProgressIndicator(
                    color: Colors.white,
                  )),
                ),
              )
          ]);
        },
      ),
    );
  }
}
