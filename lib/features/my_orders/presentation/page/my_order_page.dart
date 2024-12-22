import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentpal/config/theme/color_palette.dart';
import 'package:rentpal/features/my_orders/presentation/bloc/my_order_bloc.dart';
import 'package:rentpal/features/my_orders/presentation/bloc/my_order_event.dart';
import 'package:rentpal/features/my_orders/presentation/bloc/my_order_state.dart';

class MyOrderPage extends StatefulWidget {
  const MyOrderPage({super.key});

  @override
  State<MyOrderPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyOrderPage> {
  @override
  void initState() {
    super.initState();
    context.read<MyOrderBloc>().add(GetOrders());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My orders'),
      ),
      body: BlocBuilder<MyOrderBloc, MyOrderState>(builder: (context, state) {
        if (state is MyOrderLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: ColorPalette.primaryColor,
            ),
          );
        }
        if (state is MyOrderError) {
          return Center(child: Text(state.errorMessage!));
        }
        if (state is MyOrderSuccess) {
          if (state.data?.isEmpty ?? true) {
            return const Center(
              child: Text('No Orders Available!'),
            );
          }
          return ListView.builder(
              itemCount: state.data!.length,
              itemBuilder: (context, index) {
                return Center(
                  child: Text(state.data![index].title.toString()),
                );
              });
        }
        return const SizedBox();
      }),
    );
  }
}
