import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rentpal/core/extension/extension.dart';
import 'package:rentpal/features/rentitem/presentation/bloc/rentitem_bloc.dart';
import 'package:rentpal/features/rentitem/presentation/bloc/rentitem_state.dart';
import 'package:shimmer/shimmer.dart';

class RentalCategory extends StatelessWidget {
  const RentalCategory({super.key, this.title});

  final String? title;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RentitemBloc, RentitemState>(builder: (context, state) {
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
            child: state is RentItemSuccess
                ? ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: state.rentitem!.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          context.push("/product-detail",
                              extra: state.rentitem![index]);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: SizedBox(
                            width: 140,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Hero(
                                  tag: state.rentitem![index].thumbnailImage ??
                                      "",
                                  transitionOnUserGestures: true,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    clipBehavior: Clip.hardEdge,
                                    child: CachedNetworkImage(
                                      height: 0.12.h(context),
                                      imageUrl: state.rentitem![index]
                                              .thumbnailImage ??
                                          "",
                                      fit: BoxFit.cover,
                                      placeholder: (context, url) => SizedBox(
                                        width: 140,
                                        height: 0.15.h(context),
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
                                  "Rs. ${state.rentitem![index].price}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        fontSize: 0.012.toRes(context),
                                      ),
                                ),
                                Text(
                                  "${state.rentitem![index].title}",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        fontSize: 0.012.toRes(context),
                                      ),
                                ),
                                Text(
                                  "${state.rentitem![index].address}",
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
                    })
                : const Center(child: CircularProgressIndicator()),
          )
        ],
      );
    });
  }
}
