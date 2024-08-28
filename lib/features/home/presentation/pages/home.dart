import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Home extends StatefulWidget {
  final Widget child;
  const Home({super.key, required this.child});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;

  void onChanged(int index) {
    switch (index) {
      case 0:
        context.go("/");
        break;
      case 1:
        context.go("/rentals");
        break;
      case 2:
        context.go("/add_listing");
        break;
      case 3:
        context.go("/my_listing");
        break;
      case 4:
        context.go("/menu");
        break;
    }
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: GNav(
        iconSize: 22,
        selectedIndex: currentIndex,
        onTabChange: onChanged,
        activeColor: Colors.blue,
        color: Colors.black,
        tabs: const [
          GButton(icon: Icons.home),
          GButton(icon: Icons.message),
          GButton(icon: Icons.add),
          GButton(icon: Icons.list_alt_outlined),
          GButton(icon: Icons.menu),
        ],
      ),
    );
  }
}
