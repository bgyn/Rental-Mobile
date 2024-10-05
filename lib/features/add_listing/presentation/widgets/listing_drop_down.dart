import 'package:flutter/material.dart';
import 'package:rentpal/config/theme/color_palette.dart';
import 'package:rentpal/core/extension/extension.dart';

class ListingDropDown extends StatelessWidget {
  const ListingDropDown(
      {super.key,
      required this.items,
      required this.title,
      required this.onChanged,
      this.validator,
      this.value});

  final List<String> items;
  final String title;
  final Function(String?) onChanged;
  final FormFieldValidator<String>? validator;
  final String? value;

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
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontSize: 0.013.toRes(context),
              ),
        ),
        SizedBox(
          height: 0.01.h(context),
        ),
        DropdownButtonFormField(
            hint: const Text("Choose"),
            decoration: const InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
              focusedBorder: OutlineInputBorder(),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ColorPalette.errorColor),
              ),
            ),
            dropdownColor: Colors.grey.shade100,
            menuMaxHeight: 0.3.h(context),
            items: items
                .map(
                  (item) => DropdownMenuItem(
                    value: item,
                    child: Text(item),
                  ),
                )
                .toList(),
            validator: validator,
            onChanged: onChanged),
      ],
    );
  }
}
