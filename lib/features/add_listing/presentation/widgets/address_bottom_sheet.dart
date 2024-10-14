import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
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
  void initState() {
    context.read<AddressBloc>().add(ResetAddress());
    super.initState();
  }

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
                          border: Border.all(color: ColorPalette.primaryColor),
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
                      
                      SizedBox(
                        height: 0.16.h(context),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 0.7.w(context),
                              child: ListingTextField(
                                title: "Find your address",
                                controller: addressController,
                                hintText: "enter an address",
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: IconButton(
                                color: Colors.red,
                                iconSize: 0.03.toRes(context),
                                onPressed: () {
                                  if (addressController.text.isEmpty) {
                                    
                                  } else {
                                    context.read<AddressBloc>().add(SearchAddress(
                                        query: addressController.text));
                                  }
                                },
                                icon: const Icon(Icons.search),
                              ),
                            ),
                          ],
                        ),
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
                    onPressed: () {
                      if (selectedAddress != null) {
                        context
                            .read<AddressCubit>()
                            .addAddress(selectedAddress!);
                      }
                      GoRouter.of(context).pop();
                    },
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
