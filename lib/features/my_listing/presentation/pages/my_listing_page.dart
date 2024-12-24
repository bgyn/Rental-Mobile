import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:rentpal/config/theme/color_palette.dart';
import 'package:rentpal/core/constant/url_constant.dart';
import 'package:rentpal/core/extension/extension.dart';
import 'package:rentpal/features/my_listing/domain/entity/my_listing_entity.dart';
import 'package:rentpal/features/my_listing/presentation/bloc/listing_bloc.dart';
import 'package:rentpal/features/my_listing/presentation/bloc/listing_event.dart';
import 'package:rentpal/features/my_listing/presentation/bloc/listing_state.dart';
import 'package:rentpal/features/my_listing/presentation/widgets/show_delete_confirmation.dart';

class MyListingPage extends StatefulWidget {
  const MyListingPage({super.key});

  static const List<String> item = ["All", "Published", "Unpublished"];

  @override
  State<MyListingPage> createState() => _MyListingPageState();
}

class _MyListingPageState extends State<MyListingPage> {
  String _selectedFilter = "All";
  List<MyListingEntity> _allListings = [];
  List<MyListingEntity> _filteredListings = [];

  @override
  void initState() {
    super.initState();
    context.read<ListingBloc>().add(ListingFetch());
  }

  void _applyFilter() {
    setState(() {
      if (_selectedFilter == "All") {
        _filteredListings = _allListings;
      } else if (_selectedFilter == "Published") {
        _filteredListings =
            _allListings.where((listing) => listing.status == "VF").toList();
      } else if (_selectedFilter == "Unpublished") {
        _filteredListings =
            _allListings.where((listing) => listing.status == "NVF").toList();
      }
    });
  }

  void _onFilterChanged(String? filter) {
    if (filter != null) {
      setState(() {
        _selectedFilter = filter;
        _applyFilter();
      });
    }
  }

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
      body: BlocBuilder<ListingBloc, ListingState>(
        builder: (context, state) {
          if (state is ListingLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: ColorPalette.primaryColor,
              ),
            );
          }
          if (state is ListingSuccess) {
            if (_allListings.isEmpty) {
              _allListings = state.listings ?? [];
              _filteredListings = _allListings;
            }

            return _allListings.isEmpty
                ? const Center(child: Text("No listings found"))
                : Padding(
                    padding: EdgeInsets.all(0.015.toRes(context)),
                    child: Column(
                      children: [
                        // Filter Row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Published Filter:",
                              style: TextStyle(
                                fontSize: 0.014.toRes(context),
                              ),
                            ),
                            SizedBox(
                              width: 0.5.w(context),
                              child: DropdownButtonFormField(
                                value: _selectedFilter,
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
                                isExpanded: true,
                                items: MyListingPage.item
                                    .map((filter) => DropdownMenuItem(
                                          value: filter,
                                          child: Text(filter),
                                        ))
                                    .toList(),
                                onChanged: _onFilterChanged,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 0.02.h(context)),
                        // Listings ListView
                        Expanded(
                          child: _filteredListings.isEmpty
                              ? const Center(child: Text("No listings found"))
                              : ListView.builder(
                                  itemCount: _filteredListings.length,
                                  itemBuilder: (context, index) {
                                    final listing = _filteredListings[index];
                                    return Slidable(
                                      key: Key(
                                          listing.id.toString()), // Unique key

                                      endActionPane: ActionPane(
                                        motion: const ScrollMotion(),
                                        children: [
                                          SlidableAction(
                                            onPressed: (BuildContext context) {
                                              final rentItem = listing.toJson();
                                              final rentItemJson =
                                                  Uri.encodeComponent(
                                                      jsonEncode(rentItem));
                                              context.push(
                                                  "/add_listing/add_new_listing/${"Profile-Edit"}/$rentItemJson");
                                            },
                                            icon: Icons.edit,
                                            foregroundColor: Colors.blue,
                                          ),
                                          SlidableAction(
                                            onPressed: (BuildContext context) {
                                              showDeleteConfirmationDialog(
                                                context,
                                                listing.id,
                                              );
                                            },
                                            icon: Icons.delete,
                                            foregroundColor: Colors.red,
                                          ),
                                        ],
                                      ),
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        elevation: 4,
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 8, horizontal: 12),
                                        child: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                child: CachedNetworkImage(
                                                  imageUrl: UrlConstant
                                                          .mediaUrl +
                                                      listing.thumbnailImage,
                                                  width: 0.25.w(context),
                                                  height: 0.15.h(context),
                                                  fit: BoxFit.cover,
                                                  placeholder: (context, url) =>
                                                      Container(
                                                    width: 0.25.w(context),
                                                    height: 0.15.h(context),
                                                    color: Colors.grey.shade300,
                                                    child: const Center(
                                                      child:
                                                          CircularProgressIndicator(
                                                              strokeWidth: 2),
                                                    ),
                                                  ),
                                                  errorWidget:
                                                      (context, url, error) =>
                                                          Container(
                                                    width: 0.25.w(context),
                                                    height: 0.15.h(context),
                                                    color: Colors.grey.shade300,
                                                    child: const Icon(
                                                        Icons.broken_image,
                                                        color: Colors.red),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 0.04.w(context)),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      listing.title,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .titleMedium
                                                          ?.copyWith(
                                                            fontSize: 0.018
                                                                .toRes(context),
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                    SizedBox(
                                                        height:
                                                            0.01.h(context)),
                                                    Text(
                                                      "${listing.price} / day",
                                                      style: TextStyle(
                                                        fontSize: 0.016
                                                            .toRes(context),
                                                        color: Colors
                                                            .green.shade700,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                        height:
                                                            0.01.h(context)),
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        const Icon(
                                                            Icons.location_on,
                                                            size: 16,
                                                            color: Colors.grey),
                                                        SizedBox(
                                                            width: 0.01
                                                                .w(context)),
                                                        Expanded(
                                                          child: Text(
                                                            listing.address,
                                                            maxLines: 2,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: TextStyle(
                                                              fontSize: 0.014
                                                                  .toRes(
                                                                      context),
                                                              color: Colors.grey
                                                                  .shade600,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                        ),
                      ],
                    ),
                  );
          }
          if (state is ListingError) {
            return Center(child: Text(state.error!));
          }
          return const SizedBox();
        },
      ),
    );
  }
}
