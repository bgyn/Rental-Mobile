import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentpal/features/rentitem/presentation/bloc/rentitem_bloc.dart';
import 'package:rentpal/features/rentitem/presentation/bloc/rentitem_event.dart';
import 'package:rentpal/features/rentitem/presentation/bloc/rentitem_state.dart';
import 'package:rentpal/features/rentitem/presentation/pages/rent_item.dart';
import 'package:rentpal/injection_container.dart';

class RentpalCategoryGrid extends StatelessWidget {
  const RentpalCategoryGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RentitemBloc>(
      create: (_) => RentitemBloc(sl())..add(FetchRentItem()),
      child: Scaffold(
        appBar: AppBar(
        ),
        body:
            BlocBuilder<RentitemBloc, RentitemState>(builder: (context, state) {
          if (state is RentItemLoading) {
            return const CircularProgressIndicator();
          }
          if (state is RentItemSuccess) {
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                    itemCount: state.rentitem!.length,
                itemBuilder: (context, index) {
                  return RentItem(rentItem: state.rentitem![index]);
                });
          }
          return const SizedBox();
        }),
      ),
    );
  }
}
