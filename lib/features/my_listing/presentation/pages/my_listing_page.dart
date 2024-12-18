import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentpal/config/theme/color_palette.dart';
import 'package:rentpal/core/extension/extension.dart';
import 'package:rentpal/features/my_listing/presentation/bloc/listing_bloc.dart';
import 'package:rentpal/features/my_listing/presentation/bloc/listing_event.dart';
import 'package:rentpal/features/my_listing/presentation/bloc/listing_state.dart';

class MyListingPage extends StatefulWidget {
  const MyListingPage({super.key});

  static const List<String> item = ["All", "Published", "Unpublished"];

  @override
  State<MyListingPage> createState() => _MyListingPageState();
}

class _MyListingPageState extends State<MyListingPage> {
  @override
  void initState() {
    super.initState();
    context.read<ListingBloc>().add(ListingFetch());
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
      body: BlocBuilder<ListingBloc, ListingState>(builder: (context, state) {
        if (state is ListingLoading) {
          return const Center(
              child: CircularProgressIndicator(
            color: ColorPalette.primaryColor,
          ));
        }
        if (state is ListingSuccess) {
          return state.listings?.isEmpty ?? true
              ? const Text("No listing found")
              : Padding(
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
                              items: MyListingPage.item
                                  .map((e) => DropdownMenuItem(
                                      value: e, child: Text(e)))
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
                );
        }
        if (state is ListingError) {
          return Center(child: Text(state.error!));
        }
        return const SizedBox();
      }),
    );
  }
}
