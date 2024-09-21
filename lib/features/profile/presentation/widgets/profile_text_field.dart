import 'package:flutter/material.dart';
import 'package:rentpal/core/extension/extension.dart';

class ProfileTextField extends StatelessWidget {
  const ProfileTextField({
    super.key,
    required this.textEditingController,
    required this.title,
    required this.hintText,
  });

  final TextEditingController textEditingController;
  final String title;
  final String hintText;

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
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        TextFormField(
          controller: textEditingController,
          maxLines: null,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(0),
            hintText: hintText,
            hintStyle: TextStyle(
                color: Colors.grey.shade400, fontWeight: FontWeight.normal),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent)),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent)),
          ),
        ),
      ],
    );
  }
}
