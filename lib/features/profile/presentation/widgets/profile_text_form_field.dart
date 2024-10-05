import 'package:flutter/material.dart';
import 'package:rentpal/config/theme/color_palette.dart';
import 'package:rentpal/core/extension/extension.dart';

class ProfileTextFormField extends StatelessWidget {
  const ProfileTextFormField(
      {super.key,
      required this.textEditingController,
      required this.title,
      required this.hintText,
      this.validator});

  final TextEditingController textEditingController;
  final String title;
  final String hintText;
  final FormFieldValidator<String?>? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 0.015.h(context),
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontSize: 0.013.toRes(context),
              ),
        ),
        TextFormField(
          controller: textEditingController,
          decoration: InputDecoration(
            hintText: hintText,
            alignLabelWithHint: true,
            hintStyle: TextStyle(
                color: Colors.grey.shade400, fontWeight: FontWeight.normal),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey,
              ),
            ),
            errorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: ColorPalette.errorColor,
              ),
            ),
            focusedErrorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: ColorPalette.errorColor,
              ),
            ),
            focusedBorder: const UnderlineInputBorder(),
          ),
          validator: validator,
        ),
      ],
    );
  }
}
