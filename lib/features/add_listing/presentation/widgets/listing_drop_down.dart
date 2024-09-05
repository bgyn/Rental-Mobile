import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:rentpal/core/extension/extension.dart';

class ListingDropDown extends StatelessWidget {
  const ListingDropDown(
      {super.key,
      required this.items,
      required this.title,
      required this.onChanged,
      this.value});

  final List<String> items;
  final String title;
  final Function(dynamic) onChanged;
  final String? value;

  @override
  Widget build(BuildContext context) {
    log(items.toString());
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
        DropdownButtonFormField(
            hint: const Text("Choose"),
            decoration: const InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
              focusedBorder: OutlineInputBorder(),
            ),
            items: items
                .map(
                  (item) => DropdownMenuItem(
                    value: item,
                    child: Text(item),
                  ),
                )
                .toList(),
            onChanged: onChanged),
      ],
    );
  }
}
