import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rentpal/config/theme/color_palette.dart';
import 'package:rentpal/core/extension/extension.dart';

class AddListingPage extends StatelessWidget {
  const AddListingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleMedium?.copyWith(
          fontSize: 0.015.toRes(context),
        );
    final descriptionStyle = Theme.of(context)
        .textTheme
        .bodySmall
        ?.copyWith(fontSize: 0.012.toRes(context));
    final iconSize = 0.035.toRes(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorPalette.primaryColor,
        title: const Text(
          "Add Listing",
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 0.03.h(context),
          ),
          Row(
            children: [
              SizedBox(
                  width: 0.2.w(context),
                  child: Icon(
                    Icons.umbrella_sharp,
                    size: iconSize,
                  )),
              SizedBox(
                width: 0.8.w(context),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Item Coverage",
                      style: titleStyle,
                    ),
                    SizedBox(
                      height: 0.015.h(context),
                    ),
                    Text(
                      overflow: TextOverflow.clip,
                      "Each of your listings are covered up to Rs. 20,000 at no additional cost.",
                      style: descriptionStyle,
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 0.03.h(context),
          ),
          Row(
            children: [
              SizedBox(
                  width: 0.2.w(context),
                  child: Icon(
                    Icons.payment,
                    size: iconSize,
                  )),
              SizedBox(
                width: 0.8.w(context),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Fast Payment",
                      style: titleStyle,
                    ),
                    SizedBox(
                      height: 0.015.h(context),
                    ),
                    Text(
                      overflow: TextOverflow.clip,
                      "All payment are easy, secure and automatically deposited into your account.",
                      style: descriptionStyle,
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 0.03.h(context),
          ),
          Row(
            children: [
              SizedBox(
                  width: 0.2.w(context),
                  child: Icon(
                    Icons.shield_outlined,
                    size: iconSize,
                  )),
              SizedBox(
                width: 0.8.w(context),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Verified renters",
                      style: titleStyle,
                    ),
                    SizedBox(
                      height: 0.015.h(context),
                    ),
                    Text(
                      overflow: TextOverflow.clip,
                      "Our comprehensive process verfifies multiple factor, like government ID, to confirm the identity of renters.",
                      style: descriptionStyle,
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 0.03.h(context)),
          SizedBox(
            width: 0.85.w(context),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorPalette.primaryColor,
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                context.push("/add_listing/add_new_listing");
              },
              child: Text(
                "Get Started",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.white,
                      fontSize: 0.015.toRes(context),
                    ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
