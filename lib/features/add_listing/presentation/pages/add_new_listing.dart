import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rentpal/config/theme/color_palette.dart';
import 'package:rentpal/config/theme/theme.dart';
import 'package:rentpal/core/extension/extension.dart';
import 'package:rentpal/core/cubit/image_handler_cubit.dart';
import 'package:rentpal/features/add_listing/cubit/rules_cubit.dart';
import 'package:rentpal/core/common/add_photo_option.dart';
import 'package:rentpal/features/add_listing/presentation/bloc/add_listing_bloc.dart';
import 'package:rentpal/features/add_listing/presentation/widgets/listing_drop_down.dart';
import 'package:rentpal/features/add_listing/presentation/widgets/listing_text_field.dart';
import 'package:rentpal/features/add_listing/presentation/widgets/address_bottom_sheet.dart';
import 'package:rentpal/features/add_listing/presentation/widgets/rules_bottom_sheet.dart';
import 'package:rentpal/features/address/cubit/address_cubit.dart';
import 'package:rentpal/features/address/domain/entity/address_entity.dart';
import 'package:rentpal/features/categories/presentation/bloc/category_list_bloc.dart';
import 'package:rentpal/features/categories/presentation/bloc/category_list_state.dart';
import 'package:rentpal/features/my_listing/domain/entity/my_listing_entity.dart';

class AddNewListing extends StatefulWidget {
  final String? title;
  final MyListingEntity? myListingEntity;
  const AddNewListing({super.key, this.title, this.myListingEntity});

  @override
  State<AddNewListing> createState() => _AddNewListingState();
}

class _AddNewListingState extends State<AddNewListing> {
  final _titleController = TextEditingController();
  final _pricePerDayController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _quantityController = TextEditingController();
  String? _categoryController;
  String? _networkImage;
  final _formKey = GlobalKey<FormState>();

  late ImageHandlerCubit _imageHandlerCubit;
  late AddressCubit _addressCubit;
  late RulesCubit _rulesCubit;

  @override
  void initState() {
    super.initState();
    _imageHandlerCubit = context.read<ImageHandlerCubit>();
    _imageHandlerCubit.reset();
    _addressCubit = context.read<AddressCubit>();
    _addressCubit.reset();
    _rulesCubit = context.read<RulesCubit>();
    _rulesCubit.reset();
    widget.myListingEntity != null ? initalize() : null;
  }

  void initalize() async {
    _networkImage = widget.myListingEntity?.thumbnailImage;
    _titleController.text = widget.myListingEntity?.title ?? "";
    _pricePerDayController.text = widget.myListingEntity?.price ?? "";
    _descriptionController.text = widget.myListingEntity?.description ?? "";
    _quantityController.text = widget.myListingEntity?.inStock.toString() ?? "";
    _categoryController = widget.myListingEntity?.category.toString();

    _addressCubit.addAddress(AddressEntity(
      displayName: widget.myListingEntity?.address ?? "",
      lat: widget.myListingEntity?.latitude,
      lon: widget.myListingEntity?.longitude,
    ));

    final category =
        context.read<CategoryListBloc>().state.categoryList?.firstWhere(
              (category) => category.id == widget.myListingEntity?.category,
            );
    _categoryController = category?.categoryName;
    widget.myListingEntity!.itemRules.split(', ').map((rule) {
      _rulesCubit.addRules(rule: rule);
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _pricePerDayController.dispose();
    _descriptionController.dispose();
    _quantityController.dispose();
    _imageHandlerCubit.reset();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorPalette.primaryColor,
          leading: IconButton(
              onPressed: () {
                GoRouter.of(context).go("/");
              },
              icon: const Icon(
                Icons.home,
                color: Colors.white,
              )),
          title: Text(widget.title ?? " Add a new listing"),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 0.015.toRes(context),
            vertical: 0.015.toRes(context),
          ),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BlocBuilder<ImageHandlerCubit, List<XFile>>(
                      builder: (contex, state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Visibility(
                          visible: state.isNotEmpty,
                          child: const Text("Tap to select a cover photo"),
                        ),
                        SizedBox(
                          height: 0.01.h(context),
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () => addPhotoOption(context, "listing"),
                              child: Container(
                                height: 0.135.h(context),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey,
                                  ),
                                  color: Colors.grey.shade300,
                                ),
                                padding: EdgeInsets.symmetric(
                                  vertical: 0.015.toRes(context),
                                  horizontal: 0.005.toRes(context),
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
                                        fontSize: 0.012.toRes(context),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 0.01.w(context),
                            ),
                            Expanded(
                                child: state.isEmpty
                                    ? _networkImage != null
                                        ? SizedBox(
                                            width: 0.25.w(context),
                                            height: 0.14.h(context),
                                            child: FittedBox(
                                              clipBehavior: Clip.hardEdge,
                                              fit: BoxFit
                                                  .cover, // Ensures the image scales within the given width and height
                                              child: Image.network(
                                                "http://192.168.1.200:8000${_networkImage!}",
                                              ),
                                            ),
                                          )
                                        : const SizedBox()
                                    : SizedBox(
                                        height: 0.135.h(context),
                                        child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: state.length,
                                            itemBuilder: (contex, index) {
                                              final image =
                                                  File(state[index].path);

                                              return GestureDetector(
                                                onTap: () {
                                                  context
                                                      .read<ImageHandlerCubit>()
                                                      .replaceCover(
                                                          index: index);
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(5),
                                                  child: Stack(
                                                    children: [
                                                      SizedBox(
                                                        width: 0.4.w(context),
                                                        height: 0.14.h(context),
                                                        child: AspectRatio(
                                                          aspectRatio: 16 / 9,
                                                          child: Image.file(
                                                            image,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                      Positioned(
                                                        top: 3,
                                                        right: 3,
                                                        child: GestureDetector(
                                                          onTap: () => context
                                                              .read<
                                                                  ImageHandlerCubit>()
                                                              .deleteImage(
                                                                  index: index),
                                                          child: const Center(
                                                            child: Icon(
                                                              size: 22,
                                                              Icons.delete,
                                                              color: Colors.red,
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              );
                                            }),
                                      )),
                          ],
                        ),
                      ],
                    );
                  }),
                  SizedBox(
                    height: 0.02.h(context),
                  ),
                  const Divider(),
                  ListingTextField(
                    title: "Title",
                    controller: _titleController,
                    validator: (value) {
                      if (value == null || value == "") {
                        return "Title is required";
                      }
                      return null;
                    },
                  ),
                  ListingTextField(
                    title: "Price per day (Rs.)",
                    controller: _pricePerDayController,
                    hintText: "Price",
                    textInputType: TextInputType.number,
                    validator: (value) {
                      if (value == null ||
                          value == "" ||
                          int.parse(value) <= 0) {
                        return "Price is required";
                      }
                      return null;
                    },
                  ),
                  ListingTextField(
                    title: "Description",
                    controller: _descriptionController,
                    hintText: "Type here",
                    validator: (value) {
                      if (value == null || value == "") {
                        return "Description is required";
                      }
                      return null;
                    },
                  ),
                  ListingTextField(
                    title: "Quantity availiable",
                    controller: _quantityController,
                    hintText: "How many quantity do you have?",
                    textInputType: TextInputType.number,
                    validator: (value) {
                      if (value == null ||
                          value == "" ||
                          int.parse(value) <= 0) {
                        return "Quantity is required";
                      }
                      return null;
                    },
                  ),
                  BlocBuilder<CategoryListBloc, CategoryListState>(
                      builder: (context, state) {
                    return ListingDropDown(
                      value: _categoryController,
                      items: CategoryListState is CategoryListLoading
                          ? []
                          : state.categoryList
                                  ?.map((category) => category.categoryName)
                                  .where((name) => name != null)
                                  .cast<String>()
                                  .toList() ??
                              [],
                      title: "Primary Category",
                      onChanged: (value) {
                        final selectedCategory = state.categoryList?.firstWhere(
                          (category) => category.categoryName == value,
                        );
                        _categoryController = selectedCategory?.id.toString();
                      },
                      validator: (value) {
                        if (value == null || value == "") {
                          return "Please select primary category";
                        }
                        return null;
                      },
                    );
                  }),
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
        ),
        bottomNavigationBar: BlocListener<AddListingBloc, AddListingState>(
          listener: (context, state) {
            if (state is AddListingSuccess) {
              GoRouter.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Published")),
              );
            } else if (state is AddListingFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Error Publishing")),
              );
            }
          },
          child: BlocBuilder<AddListingBloc, AddListingState>(
              builder: (contex, state) {
            return Container(
              padding: EdgeInsets.only(
                  left: 0.015.toRes(context),
                  right: 0.015.toRes(context),
                  bottom: 0.01.toRes(context)),
              width: 0.9.w(context),
              child: state is AddListingLoading
                  ? const Center(child: CircularProgressIndicator())
                  : ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: ColorPalette.primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {
                        final latitude =
                            context.read<AddressCubit>().state.first.lat;
                        final longitude =
                            context.read<AddressCubit>().state.first.lon;
                        // if (_formKey.currentState?.validate() ?? false) {
                        if (widget.myListingEntity == null) {
                          context.read<AddListingBloc>().add(
                                PublishProductListing(
                                  file: File(context
                                      .read<ImageHandlerCubit>()
                                      .state
                                      .first
                                      .path),
                                  title: _titleController.text,
                                  category: _categoryController.toString(),
                                  price:
                                      double.parse(_pricePerDayController.text),
                                  description: _descriptionController.text,
                                  quantity: int.parse(_quantityController.text),
                                  rating: 0.0,
                                  noOfReviews: 0,
                                  address:
                                      "${context.read<AddressCubit>().state.first.displayName}",
                                  latitude: "$latitude",
                                  longitude: "$longitude",
                                  itemRules: context
                                      .read<RulesCubit>()
                                      .state
                                      .rules
                                      .join(", "),
                                ),
                              );
                        }
                        // }
                        final updatedImage =
                            context.read<ImageHandlerCubit>().state;
                        context.read<AddListingBloc>().add(
                              UpdateProductListing(
                                file: updatedImage.isEmpty
                                    ? null
                                    : File(context
                                        .read<ImageHandlerCubit>()
                                        .state
                                        .first
                                        .path),
                                title: _titleController.text,
                                category: _categoryController.toString(),
                                price:
                                    double.parse(_pricePerDayController.text),
                                description: _descriptionController.text,
                                quantity: int.parse(_quantityController.text),
                                rating: 0.0,
                                noOfReviews: 0,
                                address:
                                    "${context.read<AddressCubit>().state.first.displayName}",
                                latitude: "$latitude",
                                longitude: "$longitude",
                                itemRules: context
                                    .read<RulesCubit>()
                                    .state
                                    .rules
                                    .join(", "),
                              ),
                            );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Text(
                          "Publish",
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontSize: 0.015.toRes(context),
                                    color: Colors.white,
                                  ),
                        ),
                      )),
            );
          }),
        ));
  }

  _location(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 0.02.h(context),
        ),
        Text(
          "Location:",
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontSize: 0.013.toRes(context),
              ),
        ),
        SizedBox(
          height: 0.02.h(context),
        ),
        BlocBuilder<AddressCubit, List<AddressEntity>>(
            builder: (context, state) {
          if (state.isEmpty) {
            return const SizedBox();
          } else {
            return Column(
              children: state
                  .map((address) => Padding(
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
                            SizedBox(
                              width: 0.8.w(context),
                              child: Text(
                                address.displayName ?? '',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
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
          onTap: () => showAddressBottomSheet(context),
          child: Container(
            width: double.infinity,
            height: 0.04.toRes(context),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: ColorPalette.primaryColor)),
            child: Center(
                child: Text(
              "Add Address",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 0.015.toRes(context),
                    color: colors(context).primaryColor,
                  ),
            )),
          ),
        )
      ],
    );
  }

  _rules(context, onTap) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 0.02.h(context),
        ),
        Text(
          "Rules:",
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontSize: 0.013.toRes(context),
              ),
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
                border: Border.all(color: ColorPalette.primaryColor)),
            child: Center(
                child: Text(
              "Add Rules",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 0.015.toRes(context),
                    color: colors(context).primaryColor,
                  ),
            )),
          ),
        )
      ],
    );
  }
}
