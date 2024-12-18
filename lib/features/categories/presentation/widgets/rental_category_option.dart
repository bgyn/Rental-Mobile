import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rentpal/features/categories/presentation/bloc/category_list_bloc.dart';
import 'package:rentpal/features/categories/presentation/bloc/category_list_state.dart';
import 'package:shimmer/shimmer.dart';

class RentalCategoryOption extends StatelessWidget {
  const RentalCategoryOption({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryListBloc, CategoryListState>(
        builder: (_, state) {
      if (state is CategoryListLoading) {
        return Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 20),
          child: SizedBox(
            height: 40,
            child: ListView.builder(
              // Placeholder items for the shimmer effect
              scrollDirection: Axis.horizontal,
              itemCount: 6, // Number of shimmer items
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      }
      if (state is CategoryListSuccessful) {
        return Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 20),
          child: SizedBox(
            height: 50,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.categoryList?.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push("/category-product",
                          extra: state.categoryList?[index].categoryName ?? "");
                    },
                    child: Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        children: [
                          const Icon(Icons.category),
                          Text("${state.categoryList?[index].categoryName}"),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        );
      }
      return const SizedBox();
    });
  }
}
