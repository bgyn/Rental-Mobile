import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rentpal/config/theme/color_palette.dart';
import 'package:rentpal/config/theme/theme.dart';
import 'package:rentpal/core/extension/extension.dart';
import 'package:rentpal/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:rentpal/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:rentpal/features/home/presentation/cubit/navigator_cubit.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<FormState>();
    final emailCtrl = TextEditingController();
    final passwordCtrl = TextEditingController();
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraint) {
        return SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.18,
                decoration:
                    const BoxDecoration(color: ColorPalette.primaryColor),
                child: Center(
                  child: Text(
                    "Rentpal",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: Colors.white, fontSize: 32),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.12,
                  left: MediaQuery.of(context).size.width * 0.074,
                  right: MediaQuery.of(context).size.width * 0.075,
                ),
                child: Container(
                  width: 0.85.w(context),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  child: Form(
                    key: key,
                    child: Column(
                      children: [
                        SizedBox(height: 0.02.h(context)),
                        Text("Welcome Back!",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  fontSize: 24,
                                )),
                        SizedBox(height: 0.005.h(context)),
                        const Text(
                          "Sign in to your account",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 0.03.h(context)),
                        AuthTextField(
                          textEditingController: emailCtrl,
                          hintText: "Email",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Email is required";
                            } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                .hasMatch(value)) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 0.005.h(context)),
                        AuthTextField(
                          textEditingController: passwordCtrl,
                          hintText: "Password",
                          isObscure: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Password is required';
                            } else if (value.length < 6) {
                              return 'Password must be at least 6 characters long';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 0.03.h(context)),
                        GestureDetector(
                          onTap: () {
                            if (key.currentState?.validate() ?? false) {
                              context.read<AuthBloc>().add(
                                    AuthLogin(
                                      email: emailCtrl.text,
                                      password: passwordCtrl.text,
                                    ),
                                  );
                              if (context.canPop()) {
                                context.pop();
                              }
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 10),
                            width: MediaQuery.of(context).size.width * 0.5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: ColorPalette.primaryColor,
                            ),
                            child: Center(
                              child: Text(
                                "Login",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      color: Colors.white,
                                      fontSize: 0.015.toRes(context),
                                    ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 0.02.h(context)),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            "Forgot Password",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: colors(context).primaryColor,
                                  fontSize: 18,
                                ),
                          ),
                        ),
                        Divider(
                          indent: 50,
                          endIndent: 50,
                          color: Colors.grey.shade300,
                        ),
                        SizedBox(height: 0.02.h(context)),
                        Text("Don't have an account",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  fontSize: 16,
                                )),
                        SizedBox(height: 0.005.h(context)),
                        GestureDetector(
                            onTap: () {
                              context.read<NavigatorCubit>().onChanged(2);
                            },
                            child: Text(
                              "Sign Up",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                      color: colors(context).primaryColor,
                                      fontSize: 0.012.toRes(context)),
                            ))
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
