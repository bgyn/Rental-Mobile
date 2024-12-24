import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentpal/config/theme/color_palette.dart';
import 'package:rentpal/core/extension/extension.dart';
import 'package:rentpal/features/rentals/presentation/bloc/rentals_bloc.dart';
import 'package:rentpal/features/rentals/presentation/bloc/rentals_event.dart';
import 'package:rentpal/features/rentals/presentation/bloc/rentals_state.dart';
import 'package:rentpal/features/rentals/presentation/widgets/show_update_status_dialog.dart';

class RentalPage extends StatefulWidget {
  const RentalPage({super.key});

  @override
  State<RentalPage> createState() => _RentalPageState();
}

class _RentalPageState extends State<RentalPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<RentalsBloc>().add(FetchRentals());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorPalette.primaryColor,
          title: const Text(
            "Rentals",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Column(children: [
          SizedBox(
            height: 0.03.h(context),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 0.015.toRes(context),
            ),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Search inbox by person or listing",
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 0.02.toRes(context)),
                hintStyle: TextStyle(
                    fontSize: 0.011.toRes(context),
                    color: Colors.grey.shade500,
                    fontWeight: FontWeight.normal),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 2,
                    style: BorderStyle.solid,
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1.5),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 0.03.h(context),
          ),
          BlocBuilder<RentalsBloc, RentalsState>(builder: (context, state) {
            if (state is RentalsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is RentalsLoaded) {
              if (state.rentals!.isEmpty) {
                return const Center(
                  child: Text("No rentals found"),
                );
              }
              return Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 0.015.toRes(context),
                  ),
                  child: ListView.builder(
                    itemCount: state.rentals!.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 4.0),
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(12.0),
                          leading: CircleAvatar(
                            backgroundColor: ColorPalette.primaryColor,
                            child: Text(
                              state.rentals![index].title![0].toUpperCase(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          title: Text(
                            "${state.rentals![index].totalPrice} NPR",
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.rentals![index].title.toString(),
                                style: const TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(height: 4.0),
                              Text(
                                "${state.rentals![index].startDate} - ${state.rentals![index].endDate}",
                                style: const TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.edit,
                                color: ColorPalette.primaryColor),
                            onPressed: () {
                              showUpdateStatusDialog(
                                  context,
                                  state.rentals![index].title.toString(),
                                  state.rentals![index].status.toString(),
                                  (status) {
                                context.read<RentalsBloc>().add(UpdateRentals(
                                      state.rentals![index].id!,
                                      status,
                                    ));
                              });
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            } else if (state is RentalsError) {
              return Center(child: Text(state.errMessage.toString()));
            }
            return const SizedBox();
          })
        ]));
  }
}
