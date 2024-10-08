import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rentpal/config/theme/color_palette.dart';
import 'package:rentpal/core/extension/extension.dart';
import 'package:rentpal/features/rentitem/domain/entity/rentitem_entity.dart';
import 'package:rentpal/features/rentitem/presentation/pages/rental_category.dart';
import 'package:shimmer/shimmer.dart';

class ProductDetail extends StatelessWidget {
  final RentitemEntity rentitemEntity;
  const ProductDetail({super.key, required this.rentitemEntity});

  static final List<String> rentalRules = <String>[
    'No late returns',
    'Must be verified rentpal profile',
    'Must be cleaned before returned',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            toolbarHeight: 40,
            floating: true,
            backgroundColor: ColorPalette.primaryColor,
            elevation: 1,
            surfaceTintColor: Colors.transparent,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                )),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.share,
                  color: Colors.white,
                ),
              )
            ],
            expandedHeight: 0,
          )
        ],
        body: Stack(
          children: [
            Positioned.fill(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 300,
                      child: Hero(
                        tag: rentitemEntity.thumbnailImage ?? "",
                        transitionOnUserGestures: true,
                        child: CachedNetworkImage(
                          fit: BoxFit.fill,
                          imageUrl: rentitemEntity.thumbnailImage ?? "",
                          placeholder: (context, url) {
                            return SizedBox(
                              width: double.infinity,
                              height: 300,
                              child: Shimmer.fromColors(
                                baseColor: Colors.grey.shade300,
                                highlightColor: Colors.white,
                                child: Container(
                                  color: Colors.grey,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(color: Colors.white),
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            rentitemEntity.title ?? "",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(rentitemEntity.address ?? ""),
                          Text("Rating : ${rentitemEntity.rating}"),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      width: double.infinity,
                      color: Colors.white,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Rentals listed by Andrew",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          fontSize: 0.013.toRes(context),
                                        ),
                                  ),
                                  Text(
                                    "Sell all 60 of Andrew's listing",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          fontSize: 0.013.toRes(context),
                                        ),
                                  ),
                                ],
                              ),
                              Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: ColorPalette.primaryColor,
                                        width: 2),
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(50)),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      color: Colors.white,
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Description",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(fontSize: 0.015.toRes(context)),
                          ),
                          Text(
                            overflow: TextOverflow.clip,
                            rentitemEntity.description ?? "",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  fontSize: 0.013.toRes(context),
                                ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Rental Rules",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  fontSize: 0.013.toRes(context),
                                ),
                          ),
                          ...rentalRules.map((rules) => ListTile(
                                dense: true,
                                visualDensity: VisualDensity.compact,
                                leading: const Icon(
                                  Icons.circle,
                                  size: 5,
                                ),
                                title: Text(
                                  rules,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        fontSize: 0.013.toRes(context),
                                      ),
                                ),
                              ))
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      decoration: const BoxDecoration(color: Colors.white),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Other listing by Andrew"),
                          const RentalCategory(),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: ColorPalette.primaryColor, width: 2),
                              ),
                              child: Center(
                                  child: Text(
                                "See all Andrews's listing",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      fontSize: 0.015.toRes(context),
                                    ),
                              )),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      decoration: const BoxDecoration(color: Colors.white),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: const RentalCategory(
                        title: "Similiar Listing",
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorPalette.primaryColor,
        onPressed: () {},
        child: const Icon(
          Icons.add_shopping_cart_outlined,
          color: Colors.white,
        ),
      ),
    );
  }
}
