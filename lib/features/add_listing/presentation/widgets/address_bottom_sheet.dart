import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentpal/config/theme/color_palette.dart';
import 'package:rentpal/core/extension/extension.dart';
import 'package:rentpal/features/add_listing/cubit/address_cubit.dart';
import 'package:rentpal/features/add_listing/presentation/widgets/listing_text_field.dart';

addressBottomSheet(context) {
  return showModalBottomSheet(
      showDragHandle: true,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.9,
          child: Material(
            type: MaterialType.transparency,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: 0.015.toRes(context),
              ),
              child: BlocBuilder<AddressCubit, bool>(
                builder: (context, state) {
                  return Column(
                    children: [
                      const Text(
                        "Choose your address",
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 0.03.h(context),
                      ),
                      const Text(
                          "Choose one or more location where you would like to exchange the rental."),
                      SizedBox(
                        height: 0.02.h(context),
                      ),
                      GestureDetector(
                        onTap: () {
                          context.read<AddressCubit>().toggle();
                        },
                        child: Row(
                          children: [
                            const Text(
                              "Add a new address",
                              style:
                                  TextStyle(color: ColorPalette.primaryColor),
                            ),
                            Container(
                              margin:
                                  EdgeInsets.only(left: 0.015.toRes(context)),
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
                        visible: state,
                        child: Column(
                          children: [
                            ListingTextField(
                              title: "Find your address",
                              controller: TextEditingController(),
                              hintText: "enter an address",
                            ),
                            SizedBox(
                              height: 0.015.h(context),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    padding:
                                        EdgeInsets.all(0.01.toRes(context)),
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
                                  onTap: () {},
                                  child: Container(
                                    padding:
                                        EdgeInsets.all(0.01.toRes(context)),
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
                            )),
                      )
                    ],
                  );
                },
              ),
            ),
          ),
        );
      });
}
