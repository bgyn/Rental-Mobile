import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rentpal/core/extension/extension.dart';
import 'package:shimmer/shimmer.dart';

class AddListingPage extends StatelessWidget {
  const AddListingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final titleStyle =
        TextStyle(fontSize: 0.015.toRes(context), fontWeight: FontWeight.bold);
    final descriptionStyle = TextStyle(
      fontSize: 0.012.toRes(context),
    );
    final iconSize = 0.035.toRes(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Add Listing"),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                height: 0.25.h(context),
                child: CachedNetworkImage(
                  imageUrl:
                      "https://images.unsplash.com/photo-1724482606633-fa74fe4f5de1?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                  placeholder: (context, url) => SizedBox(
                    width: double.infinity,
                    height: 0.25.h(context),
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.white,
                      child: Container(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 10,
                child: Text(
                  "put your stuff to work",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 0.028.toRes(context),
                  ),
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
          const Spacer(),
          SizedBox(
            width: 0.85.w(context),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {},
              child: const Text(
                "Get Started",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
