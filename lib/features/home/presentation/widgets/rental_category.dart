import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rentpal/core/extension/extension.dart';
import 'package:rentpal/features/home/dummy_model.dart';
import 'package:shimmer/shimmer.dart';

class RentalCategory extends StatelessWidget {
  const RentalCategory({super.key, this.title});

  final String? title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title == null
            ? const SizedBox()
            : Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  title.toString(),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
        SizedBox(
          height: 0.24.h(context),
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: productsList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    context.push("/product-detail", extra: productsList[index]);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: SizedBox(
                      width: 140,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Hero(
                            tag: productsList[index].img[0],
                            transitionOnUserGestures: true,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              clipBehavior: Clip.hardEdge,
                              child: CachedNetworkImage(
                                imageUrl: productsList[index].img[0],
                                placeholder: (context, url) => SizedBox(
                                  width: 140,
                                  height: 95,
                                  child: Shimmer.fromColors(
                                    baseColor: Colors.grey.shade300,
                                    highlightColor: Colors.white,
                                    child: Container(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            "Rs. ${productsList[index].price}",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  fontSize: 0.012.toRes(context),
                                ),
                          ),
                          Text(
                            productsList[index].title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  fontSize: 0.012.toRes(context),
                                ),
                          ),
                          Text(
                            productsList[index].location,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  fontSize: 0.012.toRes(context),
                                ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
        )
      ],
    );
  }
}
