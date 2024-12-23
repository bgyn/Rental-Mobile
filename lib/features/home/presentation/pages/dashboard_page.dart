import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentpal/config/theme/color_palette.dart';
import 'package:rentpal/core/extension/extension.dart';
import 'package:rentpal/features/categories/presentation/bloc/category_list_bloc.dart';
import 'package:rentpal/features/categories/presentation/bloc/category_list_event.dart';
import 'package:rentpal/features/categories/presentation/bloc/category_list_state.dart';
import 'package:rentpal/features/home/presentation/widgets/carousel.dart';
import 'package:rentpal/features/categories/presentation/widgets/rental_category_option.dart';
import 'package:rentpal/features/search/presentation/bloc/search_bloc.dart';
import 'package:rentpal/features/search/presentation/widgets/custom_search_delegate.dart';
import 'package:rentpal/features/rentitem/presentation/pages/rental_category.dart';
import 'package:shimmer/shimmer.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  static route() =>
      MaterialPageRoute(builder: (context) => const DashboardPage());

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<CategoryListBloc>().add(const FetchCategoryList());
        },
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor: Color.fromARGB(
                    0, 133, 67, 67), // Set the status bar color to white
                statusBarIconBrightness: Brightness
                    .light, // Set icons to dark (visible on white background)
                statusBarBrightness: Brightness.light, // For iOS status bar
              ),
              pinned: true,
              expandedHeight: 80.0,
              flexibleSpace: Container(
                padding: const EdgeInsets.all(15),
                color: ColorPalette.primaryColor,
                child: Center(
                  child: SizedBox(
                    width: double.infinity,
                    child: TextField(
                      enabled: true,
                      readOnly: true,
                      onTap: () async {
                        await showSearch(
                          context: context,
                          delegate: CustomSearchDelegate(
                            BlocProvider.of<SearchBloc>(context),
                          ),
                        );
                      },
                      decoration: InputDecoration(
                          hintText: "Search",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 16.0)),
                    ),
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: RentalCategoryOption(),
            ),
            const SliverToBoxAdapter(
              child: Carousel(),
            ),
            BlocBuilder<CategoryListBloc, CategoryListState>(
              builder: (context, state) {
                if (state is CategoryListLoading) {
                  return SliverToBoxAdapter(
                    child: SizedBox(
                      height: 0.23.h(context),
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, state) {
                            return Shimmer.fromColors(
                              baseColor: Colors.grey.shade300,
                              highlightColor: Colors.white,
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 8.0),
                                width: 0.4.w(context),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            );
                          }),
                    ),
                  );
                } else if (state is CategoryListSuccessful) {
                  final categoryList = state.categoryList;

                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        if (index >= categoryList.length) return null;

                        final category = categoryList[index];

                        return RentalCategory(
                          category: category,
                        );
                      },
                      childCount: categoryList!
                          .length, // Set the child count to the list length
                    ),
                  );
                } else {
                  return const SliverToBoxAdapter(
                    child: Center(child: Text('Unknown state')),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
