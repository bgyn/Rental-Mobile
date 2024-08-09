import 'package:flutter/material.dart';

class RentalCategoryOption extends StatelessWidget {
  const RentalCategoryOption({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          child: Center(
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  child: const Column(
                    children: [
                      Icon(Icons.campaign),
                      Text("Category Name"),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  child: const Column(
                    children: [
                      Icon(Icons.campaign),
                      Text("Category Name"),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  child: const Column(
                    children: [
                      Icon(Icons.campaign),
                      Text("Category Name"),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  child: const Column(
                    children: [
                      Icon(Icons.campaign),
                      Text("Category Name"),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  child: const Column(
                    children: [
                      Icon(Icons.campaign),
                      Text("Category Name"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
