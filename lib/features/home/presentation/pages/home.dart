import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:rentpal/features/add_listing/presentation/pages/add_listing_page.dart';
import 'package:rentpal/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:rentpal/features/auth/presentation/pages/login_page.dart';
import 'package:rentpal/features/auth/presentation/pages/register_page.dart';
import 'package:rentpal/features/home/presentation/pages/dashboard_page.dart';
import 'package:rentpal/features/menu/presentation/pages/menu_page.dart';
import 'package:rentpal/features/my_listing/presentation/pages/my_listing_page.dart';
import 'package:rentpal/features/rentals/presentation/pages/rental_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;

  List loggedInRoute = [
    const HomePage(),
    RentalPage(),
    const AddListingPage(),
    const MyListingPage(),
    const MenuPage(),
  ];

  List loggedOutRoute = [
    const HomePage(),
    const LoginPage(),
    const RegisterPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
      return state.isLoggedIn == true
          ? loggedInRoute[currentIndex]
          : loggedOutRoute[currentIndex];
    }), bottomNavigationBar:
            BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
      return GNav(
        iconSize: 22,
        selectedIndex: currentIndex,
        onTabChange: (value) {
          currentIndex = value;
          setState(() {});
        },
        activeColor: Colors.blue,
        color: Colors.black,
        tabs: state.isLoggedIn == true
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
                GButton(icon: Icons.app_registration_rounded)
              ],
      );
    }));
  }
}
