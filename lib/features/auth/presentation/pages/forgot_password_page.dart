import 'package:flutter/material.dart';
import 'package:rentpal/config/theme/color_palette.dart';
import 'package:rentpal/core/extension/extension.dart';
import 'package:rentpal/features/auth/presentation/widgets/auth_text_field.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _oldPasswordCtrl = TextEditingController();
  final _newPasswordCtrl = TextEditingController();
  final _confirmPasswordCtrl = TextEditingController();
  final _key = GlobalKey<FormState>();

  @override
  void dispose() {
    _oldPasswordCtrl.dispose();
    _newPasswordCtrl.dispose();
    _confirmPasswordCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: ColorPalette.primaryColor,
        title: const Text(
          "Password",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(
          0.015.toRes(context),
        ),
        child: SingleChildScrollView(
          child: Form(
            key: _key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Old Password",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: 0.013.toRes(context),
                      ),
                ),
                AuthTextField(
                  isObscure: true,
                  textEditingController: _oldPasswordCtrl,
                  hintText: "Old password",
                  validator: (value) {
                    if (value == null || value == "") {
                      return "Old password in required";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 0.015.h(context),
                ),
                Text(
                  "New Password",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: 0.013.toRes(context),
                      ),
                ),
                AuthTextField(
                  isObscure: true,
                  textEditingController: _newPasswordCtrl,
                  hintText: "New password",
                  validator: (value) {
                    if (value == null || value == "") {
                      return "New password in required";
                    } else if (value != _confirmPasswordCtrl.text) {
                      return "Password don't match";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 0.015.h(context),
                ),
                Text(
                  "Confirm Password",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: 0.013.toRes(context),
                      ),
                ),
                AuthTextField(
                  isObscure: true,
                  textEditingController: _confirmPasswordCtrl,
                  hintText: "Confirm password",
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value == "") {
                      return "Confirm password in required";
                    } else if (value != _newPasswordCtrl.text) {
                      return "Password don't match";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 0.03.h(context),
                ),
                SizedBox(
                  width: 1.0.w(context),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorPalette.primaryColor,
                      shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      if (_key.currentState?.validate() ?? false) {}
                    },
                    child: Text(
                      "Save",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.white,
                            fontSize: 0.013.toRes(context),
                          ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
