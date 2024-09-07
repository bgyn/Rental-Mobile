import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentpal/core/extension/extension.dart';
import 'package:rentpal/features/add_listing/cubit/rules_cubit.dart';
import 'package:rentpal/features/add_listing/presentation/widgets/listing_drop_down.dart';
import 'package:rentpal/features/add_listing/presentation/widgets/listing_text_field.dart';
import 'package:rentpal/features/add_listing/presentation/widgets/address_bottom_sheet.dart';
import 'package:rentpal/features/add_listing/presentation/widgets/rules_bottom_sheet.dart';
import 'package:rentpal/features/add_listing/presentation/widgets/show_popup.dart';

class AddNewListing extends StatefulWidget {
  const AddNewListing({super.key});

  @override
  State<AddNewListing> createState() => _AddNewListingState();
}

class _AddNewListingState extends State<AddNewListing> {
  final _titleController = TextEditingController();
  final _pricePerDayController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _quantityController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Add a new listing"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 0.015.toRes(context),
          vertical: 0.015.toRes(context),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    showPopup(context);
                  },
                  child: const Icon(Icons.lightbulb_outlined),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  color: Colors.grey.shade300,
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 0.015.toRes(context),
                  horizontal: 0.01.toRes(context),
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.image,
                      size: 0.04.toRes(context),
                    ),
                    Text(
                      "Add photo",
                      style: TextStyle(
                        fontSize: 0.015.toRes(context),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 0.02.h(context),
              ),
              const Divider(),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    showPopup(context);
                  },
                  child: const Icon(Icons.lightbulb_outlined),
                ),
              ),
              ListingTextField(
                title: "Title",
                controller: _titleController,
              ),
              ListingTextField(
                title: "Price per day (Rs.)",
                controller: _pricePerDayController,
                hintText: "Price",
                textInputType: TextInputType.number,
              ),
              ListingTextField(
                title: "Description",
                controller: _descriptionController,
                hintText: "Type here",
              ),
              ListingTextField(
                title: "Quantity availiable",
                controller: _quantityController,
                hintText: "How many quantity do you have?",
                textInputType: TextInputType.number,
              ),
              ListingDropDown(
                  items: const ["a", "b", "c", "d", "e"],
                  title: "Primary Category",
                  onChanged: (value) {}),
              ListingDropDown(
                  items: const ["A", "B", "C", "D", "E"],
                  title: "Secondary Category (optional)",
                  onChanged: (value) {}),
              SizedBox(
                height: 0.015.h(context),
              ),
              const Divider(),
              _location(context),
              SizedBox(
                height: 0.015.h(context),
              ),
              _rules(context, () {
                context.read<RulesCubit>().copyRulesToTemp();
                rulesBottomSheet(context);
              }),
              SizedBox(
                height: 0.03.h(context),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(
            left: 0.015.toRes(context),
            right: 0.015.toRes(context),
            bottom: 0.01.toRes(context)),
        width: 0.9.w(context),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            onPressed: () {},
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Text(
                "Publish",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )),
      ),
    );
  }

  _location(context) {
    return Column(
      children: [
        SizedBox(
          height: 0.02.h(context),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Location:",
                style: TextStyle(fontWeight: FontWeight.bold)),
            GestureDetector(
              onTap: () {
                showPopup(context);
              },
              child: const Icon(Icons.lightbulb_outlined),
            ),
          ],
        ),
        SizedBox(
          height: 0.02.h(context),
        ),
        GestureDetector(
          onTap: () => addressBottomSheet(context),
          child: Container(
            width: double.infinity,
            height: 0.04.toRes(context),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.blue)),
            child: const Center(
                child: Text(
              "Add Address",
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            )),
          ),
        )
      ],
    );
  }

  _rules(context, onTap) {
    return Column(
      children: [
        SizedBox(
          height: 0.02.h(context),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Rules:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            GestureDetector(
              onTap: () {
                showPopup(context);
              },
              child: const Icon(Icons.lightbulb_outlined),
            ),
          ],
        ),
        SizedBox(
          height: 0.02.h(context),
        ),
        BlocBuilder<RulesCubit, RulesState>(builder: (context, state) {
          if (state.rules.isEmpty) {
            return const SizedBox();
          } else {
            return Column(
              children: state.rules
                  .map((rule) => Padding(
                        padding: EdgeInsets.only(
                          bottom: 0.01.toRes(context),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 5,
                              width: 5,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            SizedBox(
                              width: 0.02.w(context),
                            ),
                            Text(rule),
                          ],
                        ),
                      ))
                  .toList(),
            );
          }
        }),
        SizedBox(
          height: 0.015.h(context),
        ),
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: double.infinity,
            height: 0.04.toRes(context),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.blue)),
            child: const Center(
                child: Text(
              "Add Rules",
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            )),
          ),
        )
      ],
    );
  }
}
