import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentpal/core/extension/extension.dart';
import 'package:rentpal/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:rentpal/features/home/presentation/cubit/navigator_cubit.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
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
              child: _registerForm(context),
            )
          ],
        ),
      ),
    );
  }

  _registerForm(BuildContext context) {
    final key = GlobalKey<FormState>();
    final fNameCtrl = TextEditingController();
    final lNameCtrl = TextEditingController();
    final emailCtrl = TextEditingController();
    final passwordCtrl = TextEditingController();
    final confirmPasswordCtrl = TextEditingController();

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
        child: Column(
          children: [
            SizedBox(height: 0.02.h(context)),
            const Text(
              "Let's create an account",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 0.05.h(context)),
            AuthTextField(
                textEditingController: fNameCtrl,
                hintText: "First Name",
                validator: (value) {
                  if (value == null || value == "") {
                    return "First name is required";
                  }
                  return null;
                }),
            SizedBox(height: 0.03.h(context)),
            AuthTextField(
                textEditingController: lNameCtrl,
                hintText: "Last Name",
                validator: (value) {
                  if (value == null || value == "") {
                    return "Last name is required";
                  }
                  return null;
                }),
            SizedBox(height: 0.03.h(context)),
            AuthTextField(
              textEditingController: emailCtrl,
              hintText: "Email",
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Email is required";
                } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                  return 'Please enter a valid email address';
                }
                return null;
              },
            ),
            SizedBox(height: 0.03.h(context)),
            AuthTextField(
              textEditingController: passwordCtrl,
              hintText: "Password",
              isObscure: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Password is required';
                } else if (value.length < 6) {
                  return 'Password must be at least 6 characters long';
                } else if (value != confirmPasswordCtrl.text) {
                  return "Password don't match";
                }
                return null;
              },
            ),
            SizedBox(height: 0.03.h(context)),
            AuthTextField(
              textEditingController: confirmPasswordCtrl,
              hintText: "Confirm",
              isObscure: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Password is required';
                } else if (value.length < 6) {
                  return 'Password must be at least 6 characters long';
                } else if (value != passwordCtrl.text) {
                  return "Password don't match";
                }
                return null;
              },
            ),
            SizedBox(height: 0.03.h(context)),
            GestureDetector(
              onTap: () {
                if (key.currentState?.validate() ?? false) {}
              },
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
                  "Create an Account",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                )),
              ),
            ),
            SizedBox(height: 0.02.h(context)),
            const Text(
              "Already have an account?",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 0.005.h(context)),
            GestureDetector(
                onTap: () {
                  context.read<NavigatorCubit>().onChanged(1);
                },
                child: const Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
