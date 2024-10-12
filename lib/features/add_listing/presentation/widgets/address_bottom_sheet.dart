import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentpal/config/theme/color_palette.dart';
import 'package:rentpal/core/extension/extension.dart';
import 'package:rentpal/features/add_listing/presentation/widgets/listing_text_field.dart';
import 'package:rentpal/features/address/bloc/address_bloc.dart';
import 'package:rentpal/features/address/bloc/address_event.dart';
import 'package:rentpal/features/address/bloc/address_state.dart';
import 'package:rentpal/features/address/cubit/address_cubit.dart';
import 'package:rentpal/features/address/domain/entity/address_entity.dart';

class AddressBottomSheet extends StatefulWidget {
  const AddressBottomSheet({super.key});

  @override
  AddressBottomSheetState createState() => AddressBottomSheetState();
}

class AddressBottomSheetState extends State<AddressBottomSheet> {
  final TextEditingController addressController = TextEditingController();
  AddressEntity? selectedAddress;
  bool showAddressTextField = false;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.9,
      child: Material(
        type: MaterialType.transparency,
        child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: 0.015.toRes(context),
            ),
            child: Column(
              children: [
                const Text(
                  "Choose your address",
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 0.03.h(context),
                ),
                const Text(
                  "Choose one or more location where you would like to exchange the rental.",
                ),
                SizedBox(
                  height: 0.02.h(context),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (showAddressTextField) {
                        showAddressTextField = false;
                      } else {
                        showAddressTextField = true;
                      }
                    });
                  },
                  child: Row(
                    children: [
                      const Text(
                        "Add a new address",
                        style: TextStyle(color: ColorPalette.primaryColor),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 0.015.toRes(context)),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Icon(
                          Icons.add,
                          color: ColorPalette.primaryColor,
                          size: 0.015.toRes(context),
                        ),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: showAddressTextField,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 0.7.w(context),
                            child: ListingTextField(
                              title: "Find your address",
                              controller: addressController,
                              hintText: "enter an address",
                            ),
                          ),
                          IconButton(
                            color: ColorPalette.primaryColor,
                            onPressed: () {
                              if (addressController.text.isEmpty) {
                                // Handle empty case
                              } else {
                                context.read<AddressBloc>().add(SearchAddress(
                                    query: addressController.text));
                              }
                            },
                            icon: const Icon(Icons.search),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 0.015.h(context),
                      ),
                      BlocBuilder<AddressBloc, AddressState>(
                          builder: (context, state) {
                        if (state is AddressSuccess) {
                          return SizedBox(
                            height: 0.4.h(context),
                            child: ListView.builder(
                                itemCount: state.address?.length ?? 0,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        addressController.text =
                                            state.address?[index].displayName ??
                                                "";
                                        selectedAddress = state.address?[index];
                                      });
                                    },
                                    child: Container(
                                      decoration: const BoxDecoration(),
                                      child: Text(
                                          "${state.address?[index].displayName}"),
                                    ),
                                  );
                                }),
                          );
                        }
                        return const SizedBox();
                      }),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.all(0.01.toRes(context)),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: ColorPalette.primaryColor,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Center(
                                child: Text(
                                  "Cancel",
                                  style: TextStyle(
                                    color: ColorPalette.primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              if (selectedAddress != null) {
                                context
                                    .read<AddressCubit>()
                                    .addAddress(selectedAddress!);
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.all(0.01.toRes(context)),
                              decoration: BoxDecoration(
                                color: ColorPalette.primaryColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Center(
                                child: Text(
                                  "Save",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const Spacer(),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(
                    bottom: 0.02.h(context),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ColorPalette.primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () {},
                    child: const Text(
                      "Save",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}

void showAddressBottomSheet(BuildContext context) {
  showModalBottomSheet(
    showDragHandle: true,
    backgroundColor: Colors.white,
    isScrollControlled: true,
    context: context,
    builder: (context) => const AddressBottomSheet(),
  );
}
