import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentpal/core/constant/image_path.dart';
import 'package:rentpal/core/extension/extension.dart';
import 'package:rentpal/features/auth/presentation/cubit/password_visibility_cubit.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PasswordVisibilityCubit(),
      child: const LoginView(),
    );
  }
}

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.18,
            decoration: const BoxDecoration(color: Colors.blue),
            child: const Center(
              child: Text(
                "Rentpal",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.12,
              left: MediaQuery.of(context).size.width * 0.074,
              right: MediaQuery.of(context).size.width * 0.075,
            ),
            child: _loginForm(context),
          )
        ],
      ),
    );
  }

  _loginForm(BuildContext context) {
    final key = GlobalKey<FormState>();
    final emailCtrl = TextEditingController();
    final passwordCtrl = TextEditingController();

    return Container(
      width: 0.85.w(context),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Form(
        key: key,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 0.02.h(context)),
              const Text(
                "Welcome Back!",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 0.005.h(context)),
              const Text(
                "Sign in to your account",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 0.03.h(context)),
              TextFormField(
                cursorColor: Colors.blue,
                decoration: const InputDecoration(
                  hintText: "Email",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                ),
                controller: emailCtrl,
              ),
              SizedBox(height: 0.005.h(context)),
              BlocBuilder<PasswordVisibilityCubit, bool>(
                  builder: (context, state) {
                return TextFormField(
                  controller: passwordCtrl,
                  obscureText: state,
                  cursorColor: Colors.blue,
                  decoration: InputDecoration(
                    hintText: "Password",
                    suffixIcon: IconButton(
                      onPressed: () => context
                          .read<PasswordVisibilityCubit>()
                          .toogleObscureText(),
                      icon: Icon(state
                          ? Icons.remove_red_eye
                          : Icons.remove_red_eye_outlined),
                    ),
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                );
              }),
              SizedBox(height: 0.03.h(context)),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.blue,
                  ),
                  child: const Center(
                      child: Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
                ),
              ),
              SizedBox(height: 0.02.h(context)),
              GestureDetector(
                onTap: () {},
                child: const Text(
                  "Forgot Password",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Divider(
                indent: 50,
                endIndent: 50,
                color: Colors.grey.shade300,
              ),
              const Text(
                "or sign in with",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 0.02.h(context)),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.black38),
                  ),
                  child: Center(
                      child: Image.asset(
                    googleLogo,
                    height: 0.025.h(context),
                  )),
                ),
              ),
              SizedBox(height: 0.02.h(context)),
              const Text(
                "Don't have an account",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 0.005.h(context)),
              GestureDetector(
                  onTap: () {},
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
