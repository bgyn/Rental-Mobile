import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rentpal/config/theme/color_palette.dart';
import 'package:rentpal/core/extension/extension.dart';
import 'package:rentpal/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:rentpal/features/home/presentation/cubit/navigator_cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    final authState = context.read<AuthCubit>().state;
    Future.delayed(
      const Duration(seconds: 3),
      () {
        if (!mounted) return;
        if (authState.isLoggedIn == true) {
          context.read<NavigatorCubit>().onChanged(0);
        } else {
          context.read<NavigatorCubit>().onChanged(1);
        }
        GoRouter.of(context).go("/");
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorPalette.primaryColor,
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Rentpal",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: 0.03.toRes(context),
                        color: Colors.white,
                      )),
              SizedBox(
                height: 0.2.h(context),
              ),
              const CircularProgressIndicator(
                color: Colors.white,
              ),
            ],
          ),
        ));
  }
}
