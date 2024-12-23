import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rentpal/features/categories/domain/entities/category_entity.dart';
import 'package:rentpal/features/rentitem/presentation/pages/rent_item.dart';

class RentpalCategoryGrid extends StatelessWidget {
  final CategoryEntity category;
  const RentpalCategoryGrid({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () => context.pop(),
          ),
          title: Text(category.categoryName.toString()),
        ),
        body: category.rentCategory!.isEmpty
            ? const Center(
                child: Text("No items found"),
              )
            : GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: category.rentCategory!.length,
                itemBuilder: (context, index) {
                  return RentItem(rentItem: category.rentCategory![index]);
                }));
  }
}
