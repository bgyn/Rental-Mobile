import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rentpal/core/constant/url_constant.dart';
import 'package:rentpal/core/extension/extension.dart';
import 'package:rentpal/features/rentitem/domain/entity/rentitem_entity.dart';
import 'package:shimmer/shimmer.dart';

class RentItem extends StatelessWidget {
  final RentitemEntity rentItem;
  const RentItem({
    super.key,
    required this.rentItem,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push("/product-detail", extra: rentItem);
      },
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: SizedBox(
          width: 0.4.w(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: rentItem.thumbnailImage ?? "",
                transitionOnUserGestures: true,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  clipBehavior: Clip.hardEdge,
                  child: CachedNetworkImage(
                    height: 0.13.h(context),
                    width: 0.4.w(context),
                    imageUrl: rentItem.thumbnailImage!.contains("http")
                        ? rentItem.thumbnailImage!
                        : "${UrlConstant.mediaUrl}${rentItem.thumbnailImage}",
                    alignment: Alignment.center,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => SizedBox(
                      width: 0.4.w(context),
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
              Flexible(
                child: Text(
                  "Rs. ${rentItem.price}",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 0.012.toRes(context),
                      ),
                ),
              ),
              Flexible(
                child: Text(
                  "${rentItem.title}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 0.012.toRes(context),
                      ),
                ),
              ),
              Flexible(
                child: Text(
                  "${rentItem.address}",
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 0.012.toRes(context),
                      ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
