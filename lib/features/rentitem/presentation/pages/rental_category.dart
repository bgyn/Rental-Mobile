import 'package:flutter/material.dart';
import 'package:rentpal/core/extension/extension.dart';
import 'package:rentpal/features/categories/domain/entities/category_entity.dart';
import 'package:rentpal/features/rentitem/presentation/pages/rent_item.dart';

class RentalCategory extends StatelessWidget {
  final CategoryEntity category;
  const RentalCategory({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        category.categoryName == null
            ? const SizedBox()
            : Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  category.categoryName.toString(),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
        SizedBox(
            height: 0.24.h(context),
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: category.rentCategory!.length,
                itemBuilder: (context, index) {
                  return RentItem(
                    rentItem: category.rentCategory![index],
                  );
                }))
      ],
    );
  }
}
