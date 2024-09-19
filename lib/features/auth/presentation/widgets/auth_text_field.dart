import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentpal/features/auth/presentation/cubit/password_visibility_cubit.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
    required this.textEditingController,
    required this.hintText,
    this.isObscure = false,
    required this.validator,
  });

  final TextEditingController textEditingController;
  final bool isObscure;
  final String hintText;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PasswordVisibilityCubit(),
      child: BlocBuilder<PasswordVisibilityCubit, bool>(
        builder: (context, state) {
          return TextFormField(
            controller: textEditingController,
            obscureText: isObscure ? state : false,
            decoration: InputDecoration(
              hintText: hintText,
              suffixIcon: isObscure
                  ? IconButton(
                      onPressed: () => context
                          .read<PasswordVisibilityCubit>()
                          .toogleObscureText(),
                      icon: Icon(state
                          ? Icons.remove_red_eye
                          : Icons.remove_red_eye_outlined),
                    )
                  : null,
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
            validator: validator,
          );
        },
      ),
    );
  }
}
