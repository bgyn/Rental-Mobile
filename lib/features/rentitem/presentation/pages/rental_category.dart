import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentpal/core/extension/extension.dart';
import 'package:rentpal/features/rentitem/presentation/bloc/rentitem_bloc.dart';
import 'package:rentpal/features/rentitem/presentation/bloc/rentitem_state.dart';
import 'package:rentpal/features/rentitem/presentation/pages/rent_item.dart';

class RentalCategory extends StatelessWidget {
  const RentalCategory({super.key, this.title});

  final String? title;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RentitemBloc, RentitemState>(builder: (context, state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title == null
              ? const SizedBox()
              : Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    title.toString(),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
          SizedBox(
            height: 0.24.h(context),
            child: state is RentItemSuccess
                ? ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: state.rentitem!.length,
                    itemBuilder: (context, index) {
                      return RentItem(
                        rentItem: state.rentitem![index],
                      );
                    })
                : const Center(child: CircularProgressIndicator()),
          )
        ],
      );
    });
  }
}
