import 'package:flutter/material.dart';
import 'package:rentpal/config/theme/color_palette.dart';
import 'package:rentpal/core/extension/extension.dart';

class ProfileDropdownFormField<T> extends StatelessWidget {
  const ProfileDropdownFormField({
    super.key,
    required this.title,
    required this.items,
    required this.value,
    required this.onChanged,
    this.validator,
    this.hintText,
  });

  final String title;
  final List<DropdownMenuItem<T>> items;
  final T? value;
  final ValueChanged<T?> onChanged;
  final FormFieldValidator<T?>? validator;
  final String? hintText;

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
        DropdownButtonFormField<T>(
          value: value,
          items: items,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hintText,
            alignLabelWithHint: true,
            hintStyle: TextStyle(
              color: Colors.grey.shade400,
              fontWeight: FontWeight.normal,
            ),
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
