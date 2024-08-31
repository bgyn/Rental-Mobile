import 'package:flutter/material.dart';
import 'package:rentpal/core/extension/extension.dart';
import 'package:rentpal/features/add_listing/presentation/widgets/listing_text_field.dart';

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
                    _showPopup(context);
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
                    _showPopup(context);
                  },
                  child: const Icon(Icons.lightbulb_outlined),
                ),
              ),
              ListingTextField(
                title: "Title",
                controller: _titleController,
              ),
              ListingTextField(
                title: "Price per day (\$)",
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
              ListingTextField(
                title: "Primay Category",
                controller: _quantityController,
                hintText: "Choose",
                textInputType: TextInputType.number,
              ),
              ListingTextField(
                title: "Secondary category (optional)",
                controller: _quantityController,
                hintText: "Choose",
                textInputType: TextInputType.number,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        width: 0.9.w(context),
        child: FloatingActionButton(
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            onPressed: () {},
            child: Text("Publish")),
      ),
    );
  }

  _showPopup(context) {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Container(
              padding: EdgeInsets.all(0.015.toRes(context)),
              width: 1.0.w(context),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 0.8.w(context),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 0,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Got It",
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
        });
  }
}
