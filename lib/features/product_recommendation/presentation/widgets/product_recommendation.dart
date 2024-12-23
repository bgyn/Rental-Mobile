import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentpal/core/extension/extension.dart';
import 'package:rentpal/features/product_recommendation/presentation/bloc/recommendatino_event.dart';
import 'package:rentpal/features/product_recommendation/presentation/bloc/recommendation_bloc.dart';
import 'package:rentpal/features/product_recommendation/presentation/bloc/recommendation_state.dart';
import 'package:rentpal/features/rentitem/presentation/pages/rent_item.dart';

class ProductRecommendation extends StatefulWidget {
  const ProductRecommendation({super.key});

  @override
  State<ProductRecommendation> createState() => _ProductRecommendationState();
}

class _ProductRecommendationState extends State<ProductRecommendation> {
  @override
  void initState() {
    super.initState();
    context.read<RecommendationBloc>().add(const FetchRecommendation());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecommendationBloc, RecommendationState>(
        builder: (context, state) {
      if (state is RecommendationLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is RecommendationLoaded) {
        if (state.rentItems?.isEmpty ?? true) {
          return const SizedBox();
        }
        return SizedBox(
          height: 0.25.h(context),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.rentItems!.length,
            itemBuilder: (context, index) {
              final item = state.rentItems![index];
              return RentItem(
                rentItem: item,
              );
            },
          ),
        );
      } else if (state is RecommendationError) {
        return Center(
          child: Text(state.errorMessage.toString()),
        );
      }
      return const SizedBox();
    });
  }
}
