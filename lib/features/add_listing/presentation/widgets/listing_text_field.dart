import 'package:flutter/material.dart';
import 'package:rentpal/config/theme/color_palette.dart';
import 'package:rentpal/core/extension/extension.dart';

class ListingTextField extends StatelessWidget {
  const ListingTextField(
      {super.key,
      required this.title,
      this.hintText,
      this.textInputType,
      this.validator,
      required this.controller});
  final String title;
  final String? hintText;
  final TextEditingController controller;
  final TextInputType? textInputType;
  final FormFieldValidator<String?>? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 0.01.h(context),
        ),
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 0.01.h(context),
        ),
        TextFormField(
          controller: controller,
          keyboardType: textInputType ?? TextInputType.text,
          decoration: InputDecoration(
            hintText: hintText ?? "",
            alignLabelWithHint: true,
            hintStyle: TextStyle(
                color: Colors.grey.shade400, fontWeight: FontWeight.normal),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey,
              ),
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: ColorPalette.errorColor,
              ),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: ColorPalette.errorColor,
              ),
            ),
            focusedBorder: const OutlineInputBorder(),
          ),
          validator: validator,
        ),
      ],
    );
  }
}
