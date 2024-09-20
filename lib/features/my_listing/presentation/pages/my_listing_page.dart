import 'package:flutter/material.dart';
import 'package:rentpal/config/theme/color_palette.dart';
import 'package:rentpal/core/extension/extension.dart';

class MyListingPage extends StatelessWidget {
  const MyListingPage({super.key});

  static List<String> item = ["All", "Published", "Unpublished"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorPalette.primaryColor,
        title: const Text(
          "My Listings",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(0.015.toRes(context)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Published Filter : ",
                  style: TextStyle(
                    fontSize: 0.014.toRes(context),
                  ),
                ),
                SizedBox(
                  width: 0.5.w(context),
                  child: DropdownButtonFormField(
                    value: "All",
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 1,
                          style: BorderStyle.solid,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(),
                    ),
                    // value: "All",
                    isExpanded: true,
                    items: item
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                    onChanged: (_) {},
                  ),
                )
              ],
            ),
            SizedBox(
              height: 0.02.h(context),
            ),
            const Text("No listing found")
          ],
        ),
      ),
    );
  }
}
