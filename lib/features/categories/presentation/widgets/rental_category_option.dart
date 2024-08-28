import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
              height: 50,
              child: Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.white,
                child: const SizedBox(
                  width: double.infinity,
                  height: 30,
                ),
              ),
            ));
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
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        children: [
                          const Icon(Icons.campaign),
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
