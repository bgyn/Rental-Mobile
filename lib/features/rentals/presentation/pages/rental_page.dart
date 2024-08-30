import 'package:flutter/material.dart';
import 'package:rentpal/core/extension/extension.dart';

class RentalPage extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

  RentalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            "Rentals",
          ),
        ),
        body: Column(children: [
          SizedBox(
            height: 0.03.h(context),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 0.015.toRes(context),
            ),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Search inbox by person or listing",
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 0.02.toRes(context)),
                hintStyle: TextStyle(
                    fontSize: 0.011.toRes(context),
                    color: Colors.grey.shade500,
                    fontWeight: FontWeight.normal),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 10,
                    style: BorderStyle.solid,
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1.5),
                ),
              ),
            ),
          )
        ]));
  }
}
