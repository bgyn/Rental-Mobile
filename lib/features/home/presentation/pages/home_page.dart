import 'package:flutter/material.dart';
import 'package:rentpal/features/home/presentation/widgets/carousel.dart';
import 'package:rentpal/features/home/presentation/widgets/rental_category.dart';
import 'package:rentpal/features/home/presentation/widgets/rental_category_option.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static route() => MaterialPageRoute(builder: (context) => const HomePage());

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 70.0,
            flexibleSpace: Container(
              padding: const EdgeInsets.all(15),
              color: Colors.blue,
              child: Center(
                child: SizedBox(
                  width: double.infinity,
                  child: TextField(
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
          const SliverToBoxAdapter(
            child: RentalCategory(
              title: "Newest",
            ),
          ),
          const SliverToBoxAdapter(
            child: RentalCategory(
              title: "Outdoor Gear",
            ),
          ),
          const SliverToBoxAdapter(
            child: RentalCategory(
              title: "Sports",
            ),
          ),
          const SliverToBoxAdapter(
            child: RentalCategory(
              title: "Party & Events",
            ),
          ),
        ],
      ),
    );
  }
}
