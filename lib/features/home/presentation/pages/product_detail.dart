import 'package:cached_network_image/cached_network_image.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentpal/config/theme/color_palette.dart';
import 'package:rentpal/core/extension/extension.dart';
import 'package:rentpal/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:rentpal/features/favourite/presentation/bloc/favourite_bloc.dart';
import 'package:rentpal/features/favourite/presentation/bloc/favourite_event.dart';
import 'package:rentpal/features/favourite/presentation/bloc/favourite_state.dart';
import 'package:rentpal/features/rentitem/domain/entity/rentitem_entity.dart';
import 'package:rentpal/features/rentitem/presentation/bloc/rentitem_bloc.dart';
import 'package:rentpal/features/rentitem/presentation/bloc/rentitem_event.dart';
import 'package:rentpal/features/rentitem/presentation/pages/rental_category.dart';
import 'package:rentpal/injection_container.dart';
import 'package:shimmer/shimmer.dart';

class ProductDetail extends StatefulWidget {
  final RentitemEntity rentitemEntity;
  const ProductDetail({super.key, required this.rentitemEntity});

  static final List<String> rentalRules = <String>[
    'No late returns',
    'Must be verified rentpal profile',
    'Must be cleaned before returned',
  ];

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  void initState() {
    super.initState();
    context.read<FavouriteBloc>().add(const FavouriteLoad());
  }

  @override
  Widget build(BuildContext context) {
    final authState = context.read<AuthBloc>().state;
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
              authState is AuthSuccess
                  ? BlocListener<FavouriteBloc, FavouriteState>(
                      listener: (context, state) {
                      if (state is FavouriteError) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(state.message)),
                        );
                      }
                    }, child: BlocBuilder<FavouriteBloc, FavouriteState>(
                      builder: (context, state) {
                        return IconButton(
                          onPressed: () {
                            state is FavouriteLoaded
                                ? state.rentitems
                                        .contains(widget.rentitemEntity)
                                    ? {
                                        context.read<FavouriteBloc>().add(
                                            FavouriteRemove(
                                                widget.rentitemEntity.id!))
                                      }
                                    : {
                                        context.read<FavouriteBloc>().add(
                                            FavouriteAdd(widget.rentitemEntity))
                                      }
                                : null;
                          },
                          icon: Icon(
                            state is FavouriteLoaded
                                ? state.rentitems
                                        .contains(widget.rentitemEntity)
                                    ? Icons.favorite
                                    : Icons.favorite_outline
                                : Icons.favorite_outline,
                            color: Colors.white,
                          ),
                        );
                      },
                    ))
                  : const SizedBox.shrink(),
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
                        tag: widget.rentitemEntity.thumbnailImage ?? "",
                        transitionOnUserGestures: true,
                        child: CachedNetworkImage(
                          fit: BoxFit.fill,
                          imageUrl: widget.rentitemEntity.thumbnailImage ?? "",
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
                            widget.rentitemEntity.title ?? "",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(widget.rentitemEntity.address ?? ""),
                          Text("Rating : ${widget.rentitemEntity.rating}"),
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
                            widget.rentitemEntity.description ?? "",
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
                          ...ProductDetail.rentalRules.map((rules) => ListTile(
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
                          BlocProvider(
                            create: (context) =>
                                RentitemBloc(sl())..add(FetchRentItem()),
                            child: const RentalCategory(),
                          ),
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
                      child: BlocProvider(
                        create: (context) =>
                            RentitemBloc(sl())..add(FetchRentItem()),
                        child: const RentalCategory(),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        padding: EdgeInsets.symmetric(
            vertical: 0.005.toRes(context), horizontal: 0.015.toRes(context)),
        color: Colors.grey.shade100,
        child: Row(
          children: [
            Text(
              "Rs. ${widget.rentitemEntity.price}/day",
              style: const TextStyle(color: Colors.black),
            ),
            SizedBox(
              width: 0.03.w(context),
            ),
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: ColorPalette.primaryColor),
                onPressed: () async {
                  final values = await showCalendarDatePicker2Dialog(
                      context: context,
                      config: CalendarDatePicker2WithActionButtonsConfig(
                          calendarType: CalendarDatePicker2Type.range),
                      dialogSize: const Size(1.0, 1.0));
                },
                child: const Text(
                  "Choose your date",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
